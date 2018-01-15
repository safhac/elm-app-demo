# Elm app demo 
## using elm-webpack-starter
## rtfeldman/elm-css
## evancz/url-parser & elm-lang/navigation
## ryanolsonx/elm-mock-http


### About:
A demo app with generic features of a commercial app
* Webpack
* Elm Css
* Routing
* Json Decoding

## User
* Log in/out and registration
## Product (Items/Posts)
* Mock server calls and json decoding
* Filtering and sorting operations


### Install:
```
git clone git@github.com:safhac/elm-app-demo.git my-elm-project
cd my-elm-project
```

Re-initialize the project folder as your own repo:
```
rm -rf .git         # on Windows: rmdir .git /s /q
git init
git add .
git commit -m 'first commit'
```

Install all dependencies using the handy `reinstall` script:
```
npm run reinstall
```
*This does a clean (re)install of all npm and elm packages, plus a global elm install.*


### Serve locally:
```
npm start
```
* Access app at `http://localhost:8080/`
* Get coding! The entry point file is `src/elm/Main.elm`
* Browser will refresh automatically on any file changes..


### Build & bundle for prod:
```
npm run build
```

* Files are saved into the `/dist` folder
* To check it, open `dist/index.html`

