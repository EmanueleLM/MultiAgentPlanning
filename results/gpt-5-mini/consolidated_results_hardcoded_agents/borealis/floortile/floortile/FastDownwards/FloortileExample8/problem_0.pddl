(define (problem paint-vertical-column)
  (:domain painting-robots)

  (:objects
    r1 - robot
    top mid bottom - tile
    red blue - color
  )

  ;; Initial state:
  ;; - Robot r1 starts at the middle tile
  ;; - All tiles are initially clear (unpainted)
  ;; - Robot starts with color red
  ;; - Spatial connections: top is north of mid, mid north of bottom? (define consistent north/south)
  ;;   We'll define north relationships so that painting up from mid targets top and painting down from mid targets bottom.
  (:init
    (robot-at r1 mid)
    (has-color r1 red)

    (clear top)
    (clear mid)
    (clear bottom)

    ;; adjacency (directional)
    (north mid top)
    (south top mid)

    (north bottom mid)
    (south mid bottom)

    ;; No east/west links in this single-column layout (left/right moves will be inapplicable)
  )

  ;; Goals: paint the top tile red, paint the bottom tile blue, and finish with the robot at the middle tile.
  ;; These are hard constraints and must all hold in the final state.
  (:goal (and
    (painted top red)
    (painted bottom blue)
    (robot-at r1 mid)
  ))

  ;; Minimize total cost of actions
  (:metric minimize (total-cost))
)