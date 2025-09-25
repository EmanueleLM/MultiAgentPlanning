(define (problem combined-trip)
  (:domain combined-travel)
  (:objects
    amsterdam vilnius bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - dayval
    l0 l1 l2 l3 l4 l5 l6 - level
  )

  (:init
    ;; initial day
    (day d1)
    (is-start d1)

    ;; day succession
    (succ d1 d2)
    (succ d2 d3)
    (succ d3 d4)
    (succ d4 d5)
    (succ d5 d6)
    (succ d6 d7)
    (succ d7 d8)
    (succ d8 d9)
    (succ d9 d10)
    (succ d10 d11)
    (succ d11 d12)

    ;; permissions per day
    (allow-advance d1) (allow-advance d2) (allow-advance d3) (allow-advance d4) (allow-advance d5)
    (allow-advance d6) (allow-advance d7) (allow-advance d8) (allow-advance d9) (allow-advance d10) (allow-advance d11)

    (allow-flight d1) (allow-flight d2) (allow-flight d3) (allow-flight d4) (allow-flight d5)
    (allow-flight d6) (allow-flight d7) (allow-flight d8) (allow-flight d9) (allow-flight d10)

    (allow-wait d1) (allow-wait d2) (allow-wait d3) (allow-wait d4) (allow-wait d5)
    (allow-wait d6) (allow-wait d7) (allow-wait d8) (allow-wait d9) (allow-wait d10)

    ;; meeting window in Bucharest (days 6..11)
    (meet-window d6) (meet-window d7) (meet-window d8) (meet-window d9) (meet-window d10) (meet-window d11)

    ;; level decrement relations (precomputed arithmetic)
    (level-dec l6 l5)
    (level-dec l5 l4)
    (level-dec l4 l3)
    (level-dec l3 l2)
    (level-dec l2 l1)
    (level-dec l1 l0)

    ;; remain values encoded as predicates (days still to stay in each city)
    (remain amsterdam l4)
    (remain vilnius l1)
    (remain bucharest l6)

    ;; direct flight connectivity (public information + planner)
    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct vilnius amsterdam)
    (direct amsterdam vilnius)

    (is-bucharest bucharest)

    ;; initial location
    (at amsterdam)
    (in amsterdam)
    (visited amsterdam)
  )

  (:goal
    (and
      (day d12)
      (remain amsterdam l0)
      (remain vilnius l0)
      (remain bucharest l0)
      (met)
      (met-friends)
      (visited amsterdam)
      (visited vilnius)
      (visited bucharest)
    )
  )

  (:metric minimize (total-cost))
)