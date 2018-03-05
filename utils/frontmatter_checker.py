import os
import argparse
from contextlib import contextmanager

import yaml


parser = argparse.ArgumentParser(description='''Check YAML frontmatter of LXIYM files''')
parser.add_argument('paths', type=str, nargs='+', help='Paths to search for LXIYM docs')


def check(t, msg):
    if t:
        print msg


def read_frontmatter(path):
    frontmatter = []
    in_fm = False

    with open(path) as f:
        for line in f:
            if line.strip() == '---':
                in_fm = not in_fm
                if not in_fm:
                    return yaml.load('\n'.join(frontmatter))
            if in_fm:
                frontmatter.append(line)

    return None


@contextmanager
def errorlogger(msg):
    log = [msg]
    def logger(msg):
        log.append(msg)

    yield logger

    if len(log) > 1:
        for l in log:
            print l
        print ""


def check_frontmatter(path):
    if os.path.isdir(path):
        for p in os.listdir(path):
            check_frontmatter(os.path.join(path, p))
        return

    if not os.path.isfile(path):
        print("Not a file or a dir:", path)
        return

    if not path.endswith(".markdown"):
        return


    with errorlogger("Checking %s" % path) as log:
        try:
            data = read_frontmatter(path)
        except yaml.scanner.ScannerError:
            log("ERROR: Error in frontmatter")
            return

        if data is None:
            log("WARN: Could not read frontmatter.")
            return

        # "Language" docs are the default
        if not data.get('category') and not data.get('language'):
            log("WARN: Category is not present")

        category = data.get('category', 'language')

        # "Language" docs should have a filename
        if category == 'language' and not data.get('filename'):
            log("WARN: Filename missing")

        # "Filename" should have a suffix (e.g. python-pl.py) if present in a non-default-language doc
        if data.get('filename') and data.get('lang', 'en-us') != 'en-us' and '-' not in data.get('filename'):
            log("ERROR: Filename lacks language code suffix")

        # "Translators" shouldn't be empty, but this one isn't such a big deal
        # if data.get('lang', 'en-us') != 'en-us' and not data.get('translators'):
        #    log("WARN: Translators is empty!")



def main():
    args = parser.parse_args()

    for p in args.paths:
        check_frontmatter(p)


if __name__ == "__main__":
    main()
