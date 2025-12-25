#!/bin/bash
echo "Top 5 memory-consuming processes:"
ps aux --sort=-%mem | head -n 6

echo ""
echo "Top 5 CPU-consuming processes:"
ps aux --sort=-%cpu | head -n 6
