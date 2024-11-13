import pandas as pd
import json
from sqlalchemy import create_engine
import argparse

def import_json_from_file(filename, table_name, prod):
    engine = create_engine('sqlite:///slackcat.db')
    if prod:
        engine = create_engine('postgresql://newuser:password@postgres_container:5432/slackcatdb')
    try:
        with open(filename, 'r') as file:
            chunk = json.load(file)
            df = pd.DataFrame(chunk)
            df.to_sql(table_name, engine, if_exists='append', index=False)
        print(f"Data from {filename} imported successfully.")
    except Exception as e:
        print(f"Error importing files: {e}")



def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', '--filename', type=str, help='filename', required=True)
    parser.add_argument('-t', '--table', type=str, help='table', required=True)
    parser.add_argument('--prod', action='store_true', help="prod")
    args = parser.parse_args()

    import_json_from_file(args.filename, args.table, args.prod)

if __name__ == "__main__":
    main()