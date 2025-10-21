(define (problem bw-problem)
  (:domain blocksworld)

  ;; Objects
  (:objects
    red blue orange yellow - block
  )

  ;; Initial state — chosen to match the solvable scenario described in the
  ;; human specification and the provided partial plan (player1 scenario).
  ;; Configuration:
  ;;   on(blue red)
  ;;   on(orange blue)
  ;;   ontable(red)
  ;;   ontable(yellow)
  ;;   clear(orange)
  ;;   clear(yellow)
  ;;   handempty
  (:init
    (on blue red)
    (on orange blue)
    (ontable red)
    (ontable yellow)
    (clear orange)
    (clear yellow)
    (handempty)
  )

  ;; Goal: blue on red and yellow on orange
  ;; (blue on red already holds in the initial state; planner must achieve (on yellow orange))
  (:goal
    (and
      (on blue red)
      (on yellow orange)
    )
  )
)