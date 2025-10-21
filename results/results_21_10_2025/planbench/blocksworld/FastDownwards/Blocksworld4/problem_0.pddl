(define (problem bw-problem)
  (:domain blocksworld)

  ;; Objects (blocks present in the scenario)
  (:objects
    red blue orange yellow - block
  )

  ;; Initial state — merged and resolved to a consistent scenario that matches
  ;; the partial plan given (pick up yellow; stack yellow on orange)
  ;; Chosen initial configuration (consistent with player1 analysis):
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

  ;; Goal: achieve blue on top of red, and yellow on top of orange
  ;; (blue already on red in the initial state; the plan must establish (on yellow orange))
  (:goal
    (and
      (on blue red)
      (on yellow orange)
    )
  )
)