A simple implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) in Haskell, using the Gloss graphics library. My code runs the simulation on an initial board of random alive cells whose size is about 1/10th the size of the entire board. To teach myself Gloss I used [another implementation I found online](https://github.com/leonardo-ono/HaskellConwaysGameOfLife) as reference in places, but was totally original in my implementation of the simulation algorithm. My next step on this project is to add the ability to manual add cells to the initial state.

Hackage dependencies:
- Graphics.Gloss
- System.Random