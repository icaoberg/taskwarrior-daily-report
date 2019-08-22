#!/bin/bash

if [ -f index.html ]; then
	rm -fv index.html
fi

echo "# Weekly burndown" > temp.md
echo "\`\`\`" >> temp.md
task burndown.weekly >> temp.md
echo "\`\`\`" >> temp.md

echo " " >> temp.md

echo "## Computational Biology Department" >> temp.md
echo "\`\`\`" >> temp.md
task rc.report.next.sort=due-,urgency- next project:CBD >> temp.md
echo "\`\`\`" >> temp.md

echo " " >> temp.md

echo "## CellOrganizer" >> temp.md
echo "\`\`\`" >> temp.md
task rc.report.next.sort=due-,urgency- next project:CellOrganizer >> temp.md
echo "\`\`\`" >> temp.md

grip temp.md --export --no-inline index.html
rm -f temp.md
sed -i "s/temp.md/$(date)/g" index.html
