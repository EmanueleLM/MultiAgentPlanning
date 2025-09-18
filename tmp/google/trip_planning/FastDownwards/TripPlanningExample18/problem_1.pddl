(define (problem combined-trip)
  (:domain combined-travel)
  (:objects
    amsterdam vilnius bucharest - city

    ;; day values d1..d12
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - dayval

    ;; counts 0..6
    c0 c1 c2 c3 c4 c5 c6 - count
  )

  (:init
    ;; start day
    (day d1)
    (is-start d1)

    ;; successor day relations d1->d2 ... d11->d12
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

    ;; allowed day ranges precomputed
    ;; allow-advance for d1..d11 (traveler can advance day up to day11 -> to d12)
    (allow-advance d1) (allow-advance d2) (allow-advance d3) (allow-advance d4) (allow-advance d5)
    (allow-advance d6) (allow-advance d7) (allow-advance d8) (allow-advance d9) (allow-advance d10) (allow-advance d11)

    ;; allow-flight for d1..d10 (flight-fly requires day < 11)
    (allow-flight d1) (allow-flight d2) (allow-flight d3) (allow-flight d4) (allow-flight d5)
    (allow-flight d6) (allow-flight d7) (allow-flight d8) (allow-flight d9) (allow-flight d10)

    ;; allow-wait for d1..d10 (flight-wait requires day < 11)
    (allow-wait d1) (allow-wait d2) (allow-wait d3) (allow-wait d4) (allow-wait d5)
    (allow-wait d6) (allow-wait d7) (allow-wait d8) (allow-wait d9) (allow-wait d10)

    ;; meeting window days: d6..d11
    (meet-window d6) (meet-window d7) (meet-window d8) (meet-window d9) (meet-window d10) (meet-window d11)

    ;; Remaining planned stays (resolved to fit 11 days total)
    ;; Amsterdam 4, Vilnius 1, Bucharest 6
    (remain amsterdam c4)
    (remain vilnius c1)
    (remain bucharest c6)

    ;; Direct flights (bidirectional as given)
    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct vilnius amsterdam)
    (direct amsterdam vilnius)

    ;; Mark Bucharest for meeting
    (is-bucharest bucharest)

    ;; Starting location
    (at amsterdam)
    (in amsterdam)
    (visited amsterdam)

    ;; total-cost initial 0 (implicitly 0)
  )

  (:goal
    (and
      ;; reach day d12 after 11 advances
      (day d12)

      ;; all remains are zero
      (remain amsterdam c0)
      (remain vilnius c0)
      (remain bucharest c0)

      ;; meetings recorded by both agents
      (met)
      (met-friends)

      ;; all cities visited
      (visited amsterdam)
      (visited vilnius)
      (visited bucharest)
    )
  )

  (:metric minimize (total-cost))
)