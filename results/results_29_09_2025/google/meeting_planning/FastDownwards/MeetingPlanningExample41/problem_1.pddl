(define (problem meetup-you-george)
  (:domain meetup-day)

  (:objects
    northbeach haight - location
    you george - agent

    t540 t558 t603 t618 t648 t678 t738 t795 - timepoint

    dur45 dur60 dur90 dur120 dur180 dur237 - duration
  )

  (:init
    (at you northbeach)
    (at-time t540)

    (nb-ha t540 t558)

    (span dur45 t558 t603)
    (span dur60 t558 t618)
    (span dur90 t558 t648)
    (span dur120 t558 t678)
    (span dur180 t558 t738)
    (span dur237 t558 t795)
  )

  (:goal (done))
)