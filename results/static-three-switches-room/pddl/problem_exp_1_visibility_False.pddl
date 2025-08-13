(define (problem door‑unlock‑problem)
  (:domain multi-agent-switches)

  ;; --------------------------------------------------------------
  ;; objects
  ;; --------------------------------------------------------------
  (:objects
    R G B - agent ; the three agents
    red green blue - switch ; the three switches
    l00 l01 l10 l11 - location ; 2×2 grid
    )

  ;; --------------------------------------------------------------
  ;; initial state
  ;; --------------------------------------------------------------
  (:init
    ;; agents start somewhere in the square; they are not on a switch yet
    (at R l01)
    (at G l10)
    (at B l11)

    ;; connectivity of the 2×2 grid
    (connected l00 l01)
    (connected l01 l00)
    (connected l00 l10)
    (connected l10 l00)
    (connected l01 l11)
    (connected l11 l01)
    (connected l10 l11)
    (connected l11 l10)

    ;; where each switch is located
    (switch-at red l00)
    (switch-at green l11)
    (switch-at blue l10)

    ;; door is initially closed (door-open is *not* in the initial state)
  )

  ;; --------------------------------------------------------------
  ;; goal
  ;; --------------------------------------------------------------
  (:goal
    (door-open)
  )
)