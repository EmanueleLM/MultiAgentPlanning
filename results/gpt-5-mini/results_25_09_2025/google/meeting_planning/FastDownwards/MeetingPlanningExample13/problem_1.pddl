(define (problem meet-betty-problem-classical)
  (:domain meet-orchestrator-classical)

  (:objects
    you betty - agent
    presidio north_beach - location
    t0 t18 t585 t660 t705 t735 t780 - time
  )

  (:init
    (at you presidio)
    (at-time you t0)

    (at betty north_beach)
    (at-time betty t585)
    (at-time betty t660)
    (at-time betty t705)
    (at-time betty t735)
    (at-time betty t780)

    (travel-presidio-nb t0 t18)

    (before t0 t18) (before t0 t585) (before t0 t660) (before t0 t705) (before t0 t735) (before t0 t780)
    (before t18 t585) (before t18 t660) (before t18 t705) (before t18 t735) (before t18 t780)
    (before t585 t660) (before t585 t705) (before t585 t735) (before t585 t780)
    (before t660 t705) (before t660 t735) (before t660 t780)
    (before t705 t735) (before t705 t780)
    (before t735 t780)

    (min-duration t585 t660)
    (min-duration t585 t705)
    (min-duration t585 t735)
    (min-duration t585 t780)
    (min-duration t660 t735)
    (min-duration t660 t780)
    (min-duration t705 t780)
  )

  (:goal (and
    (met)
  ))

  (:metric minimize (total-cost))
)