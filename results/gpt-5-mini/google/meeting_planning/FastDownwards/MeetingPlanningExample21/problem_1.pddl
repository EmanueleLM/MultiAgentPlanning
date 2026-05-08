(define (problem meet-sam-and-margaret)
  (:domain meetup-schedule)

  (:objects
    traveler - agent
    sam marg - friend
    mission haight - location
    t0900 t0912 t0915 t0927 t0930 t0942 t0947 t0953 t1000 t1012 t1017
    t1127 t1132 t1212 t1217 t1545 t1800 - time
  )

  (:init
    (at traveler mission t0900)
    (= (total-cost) 0)

    (can-travel-mh t0930 t0942)
    (can-travel-mh t0915 t0927)
    (can-travel-mh t0900 t0912)
    (can-travel-mh t1000 t1012)

    (can-travel-hm t0942 t0953)

    (can-meet-sam t0900 t0912)
    (can-meet-sam t0900 t0915)
    (can-meet-sam t0900 t0927)
    (can-meet-sam t0900 t0930)
    (can-meet-sam t0900 t0942)
    (can-meet-sam t0900 t0947)
    (can-meet-sam t0900 t0953)
    (can-meet-sam t0900 t1000)

    (can-meet-sam t0912 t0915)
    (can-meet-sam t0912 t0927)
    (can-meet-sam t0912 t0930)
    (can-meet-sam t0912 t0942)
    (can-meet-sam t0912 t0947)
    (can-meet-sam t0912 t0953)
    (can-meet-sam t0912 t1000)

    (can-meet-sam t0915 t0927)
    (can-meet-sam t0915 t0930)
    (can-meet-sam t0915 t0942)
    (can-meet-sam t0915 t0947)
    (can-meet-sam t0915 t0953)
    (can-meet-sam t0915 t1000)

    (can-meet-sam t0927 t0930)
    (can-meet-sam t0927 t0942)
    (can-meet-sam t0927 t0947)
    (can-meet-sam t0927 t0953)
    (can-meet-sam t0927 t1000)

    (can-meet-sam t0930 t0942)
    (can-meet-sam t0930 t0947)
    (can-meet-sam t0930 t0953)
    (can-meet-sam t0930 t1000)

    (can-meet-sam t0942 t0947)
    (can-meet-sam t0942 t0953)
    (can-meet-sam t0942 t1000)

    (can-meet-sam t0947 t0953)
    (can-meet-sam t0947 t1000)

    (can-meet-sam t0953 t1000)

    (can-meet-marg t0912 t0942)
    (can-meet-marg t0912 t1012)
    (can-meet-marg t0912 t1127)
    (can-meet-marg t0912 t1212)

    (can-meet-marg t0927 t1127)
    (can-meet-marg t0927 t1212)
    (can-meet-marg t0927 t1012)

    (can-meet-marg t0930 t1012)
    (can-meet-marg t0942 t1012)
    (can-meet-marg t0942 t1127)
    (can-meet-marg t0942 t1212)

    (can-meet-marg t0947 t1017)
    (can-meet-marg t0947 t1127)
    (can-meet-marg t0947 t1212)

    (can-meet-marg t1012 t1212)
    (can-meet-marg t1012 t1132)
    (can-meet-marg t1012 t1217)

    (can-meet-marg t1017 t1217)
    (can-meet-marg t1127 t1217)
    (can-meet-marg t1132 t1217)
  )

  (:metric maximize (total-cost))

  (:goal (and (finished)))
)