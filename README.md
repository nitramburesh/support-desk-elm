# Support Desk (Elm)

A small demo app built with Elm and Vite that showcases a set of WCDS components (avatar, badge, button, card, icon, input) under `src/Components`.

## Prerequisites

- Node.js (22+ recommended)
- pnpm (project uses `pnpm` as package manager; npm or yarn can be used as alternative)

## Install

Install project dependencies:

```bash
pnpm install
```

If you don't have `pnpm` installed you can install it with `npm`:

```bash
npm install -g pnpm
```

## Development

Start the Vite development server (hot-reload):

```bash
pnpm dev
```

Open your browser at `http://localhost:5173` (Vite default).

## Build & Preview

To build a production bundle:

```bash
pnpm exec vite build
```

To preview a production build locally:

```bash
pnpm exec vite preview
```

## Formatting

This project includes Elm formatting helpers:

```bash
pnpm run format
pnpm run format:check
```

## Project structure (important files)

- `src/` — Elm source containing `Main.elm` and `Components/`
- `index.html` — app entry HTML
- `vite.config.js` — Vite configuration
- `package.json` — scripts and dependencies

## Notes

- The project uses the `vite-plugin-elm-watch` plugin to integrate Elm with Vite.
- There are no tests configured; the `test` script is a placeholder.

## License

See `package.json` (license: ISC).
