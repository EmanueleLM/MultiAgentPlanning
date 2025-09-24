(define (problem combined-trip)
  (:domain combined-travel)
  (:objects
    amsterdam vilnius bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - dayval
  )

  (:init
    (day d1)
    (is-start d1)

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

    (allow-advance d1) (allow-advance d2) (allow-advance d3) (allow-advance d4) (allow-advance d5)
    (allow-advance d6) (allow-advance d7) (allow-advance d8) (allow-advance d9) (allow-advance d10) (allow-advance d11)

    (allow-flight d1) (allow-flight d2) (allow-flight d3) (allow-flight d4) (allow-flight d5)
    (allow-flight d6) (allow-flight d7) (allow-flight d8) (allow-flight d9) (allow-flight d10)

    (allow-wait d1) (allow-wait d2) (allow-wait d3) (allow-wait d4) (allow-wait d5)
    (allow-wait d6) (allow-wait d7) (allow-wait d8) (allow-wait d9) (allow-wait d10)

    (meet-window d6) (meet-window d7) (meet-window d8) (meet-window d9) (meet-window d10) (meet-window d11)

    (= (remain amsterdam) 4)
    (= (remain vilnius) 1)
    (= (remain bucharest) 6)

    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct vilnius amsterdam)
    (direct amsterdam vilnius)

    (is-bucharest bucharest)

    (at amsterdam)
    (in amsterdam)
    (visited amsterdam)
  )

  (:goal
    (and
      (day d12)
      (= (remain amsterdam) 0)
      (= (remain vilnius) 0)
      (= (remain bucharest) 0)
      (met)
      (met-friends)
      (visited amsterdam)
      (visited vilnius)
      (visited bucharest)
    )
  )

  (:metric minimize (total-cost))
)