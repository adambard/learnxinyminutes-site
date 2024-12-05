## [LearnXInYMinutes.com](https://learnxinyminutes.com/)

This is the site behind the magic.

To build the site, first install Git and Python, then

```sh
git clone https://github.com/adambard/learnxinyminutes-site.git
cd learnxinyminutes-site
git clone https://github.com/adambard/learnxinyminutes-docs.git source/docs

pip install -r requirements.txt
python build.py
cd build/
python -m http.server
```

Then open [http://localhost:8000](http://localhost:8000) in your browser.

You need to check out the [learnxinyminutes-docs](https://github.com/adambard/learnxinyminutes-docs)
repo as `source/docs`. All the code that builds the site is in [build.py](./build.py)
