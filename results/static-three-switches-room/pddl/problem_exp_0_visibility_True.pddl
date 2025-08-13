(define (problem door-all-press)
  (:domain switch-door-sync)

  ;; ------------------------------------------------------------------
  ;; Objects – there are three agents, three switches and a set of
  ;; grid positions.
  ;; ------------------------------------------------------------------
  (:objects
    R G B - agent
    red green blue - switch
    p1 p2 p3 p4 p5 p6 p7 p8 p9 - positions
  )

  ;; ------------------------------------------------------------------
  ;; Initial state
  ;; ------------------------------------------------------------------
  (:init
    ;;  Agents start somewhere that is not the switches.  We pick the
    ;;  centre of the grid (p5) so that they can move if needed.
    (at R p5)
    (at G p5)
    (at B p5)

    ;;  Switch locations
    (switch‑pos red p2) ; (1,2)
    (switch‑pos green p9) ; (3,3)
    (switch‑pos blue p1) ; (1,1)

    ;;  No switch is pressed initially
    (not (pressed red))
    (not (pressed green))
    (not (pressed blue))

    ;;  Adjacency relations – this allows the agents to move
    ;;  on the 3×3 grid.
    (adjacent p1 p2)
    (adjacent p2 p3)
    (adjacent p4 p5)
    (adjacent p5 p6)
    (adjacent p7 p8)
    (adjacent p8 p9)
    (adjacent p2 p5)
    (adjacent p5 p2)
    (adjacent p5 p8)
    (adjacent p8 p5)
    (adjacent p1 p4)
    (adjacent p4 p1)
    (adjacent p4 p7)
    (adjacent p7 p4)
    (adjacent p3 p6)
    (adjacent p6 p3)
    (adjacent p6 p9)
    (adjacent p9 p6)
  )

  ;; ------------------------------------------------------------------
  ;;  Goal – the door must be open.
  ;; ------------------------------------------------------------------
  (:goal
    (door‑open)
  )
)