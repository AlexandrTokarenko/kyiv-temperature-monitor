# Kyiv Temperature Monitor

This script logs the temperature in Kyiv every 30 minutes and commits the data to a GitHub repository to demonstrate consistent activity.

## How it works

1. Uses `wttr.in` service to get current temperature in Kyiv
2. Appends timestamp and temperature to `temperature_log.csv`
3. Commits the updated log file to git
4. Repeats every 30 minutes

## Requirements

- Bash shell
- curl
- git

## Usage

```bash
# Make script executable
chmod +x monitor.sh

# Run in background or using nohup
nohup ./monitor.sh &
```

## Data Format

The `temperature_log.csv` file contains:
- timestamp: YYYY-MM-DD HH:MM:SS
- temperature: e.g., "+12°C" or "-5°C"

## Notes

- The script uses wttr.in which provides free weather data
- Temperature format includes sign (+/-) and Celsius symbol
- Commits are made only when new data is successfully retrieved
- For long-term running, consider using a proper process manager or cron job

## License

MIT