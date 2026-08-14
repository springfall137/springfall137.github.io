"""
Admin Private Visitor Log Maintenance Utility
Run this script to update/append records in visitor_log.txt.
"""
import datetime

LOG_FILE = "visitor_log.txt"

def add_log_entry(country, page_path, note="Direct visit"):
    now_str = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S KST")
    entry = f"{now_str} | {country} | {page_path} | {note}\n"
    with open(LOG_FILE, "a", encoding="utf-8") as f:
        f.write(entry)
    print(f"Added log entry: {entry.strip()}")

if __name__ == "__main__":
    print("Visitor Log Maintenance Script")
    print("Current contents of visitor_log.txt:")
    with open(LOG_FILE, "r", encoding="utf-8") as f:
        print(f.read())
