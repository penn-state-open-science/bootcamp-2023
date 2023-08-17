# bootcamp-2023

Files related to the Open Science Bootcamp held in August 2023.

You may view the associated website at: 

<https://penn-state-open-science.github.io/bootcamp-2023/>

### Contents

- `docs/`: Website served by GitHub pages.
- `renv/`: Files related to the `renv` package manager.
- `planning/`: Files related to planning the bootcamp.
- `src`: Source files used to generate the site using the `bookdown` package.

### Rendering

- Clone or fork the repository to a new RStudio project.
- From the project's root directory, run `renv::restore()` to add package dependencies. You may need to install `renv` first via `install.packages('renv')`. You may also need `rtools`, so `install.packages('rtools')`.
- Run `bookdown::render_book('src')` to render the files.
- View the output in `docs/` by pointing your browser to `docs/index.html`.
