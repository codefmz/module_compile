import yaml
import sys
import os

if len(sys.argv) < 3:
    sys.exit(1)

machine = sys.argv[1]
projectRoot = sys.argv[2]
yamlPath = os.path.join(projectRoot, "module.yaml")

with open(yamlPath, "r") as f:
    cfg = yaml.safe_load(f)

algos = cfg["machines"][machine]["alg"]
print(";".join(algos))