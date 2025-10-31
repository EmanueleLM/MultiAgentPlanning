(define (domain combined-meeting)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types agent location person)

  (:predicates
    (at ?a - agent ?l - location)
    (visitor-at ?l - location)
    (met ?p - person)
  )

  (:functions
    (time)       ; current time in minutes since midnight
    (met-count)  ; total number of distinct people met
  )

  ;; Agent1 travels from MissionDistrict to HaightAshbury (12 minutes)
  (:action travel-agent1-md-to-ha
    :parameters ()
    :precondition (at agent1 missiondistrict)
    :effect (and
      (not (at agent1 missiondistrict))
      (at agent1 haightashbury)
      (increase (time) 12)
    )
  )

  ;; Agent1 travels from HaightAshbury to MissionDistrict (11 minutes)
  (:action travel-agent1-ha-to-md
    :parameters ()
    :precondition (at agent1 haightashbury)
    :effect (and
      (not (at agent1 haightashbury))
      (at agent1 missiondistrict)
      (increase (time) 11)
    )
  )

  ;; Agent1 meets Margaret for 30 minutes (satisfies "at least 30").
  (:action meet-agent1-margaret
    :parameters ()
    :precondition (and
      (at agent1 haightashbury)
      (visitor-at haightashbury)
      (not (met margaret))
      (>= (time) 480)                ; start at or after 08:00
      (<= (+ (time) 30) 945)         ; finish by 15:45
    )
    :effect (and
      (met margaret)
      (increase (met-count) 1)
      (increase (time) 30)
    )
  )

  ;; Agent2 travels from MissionDistrict to HaightAshbury (12 minutes)
  (:action travel-agent2-md-to-ha
    :parameters ()
    :precondition (at agent2 missiondistrict)
    :effect (and
      (not (at agent2 missiondistrict))
      (at agent2 haightashbury)
      (increase (time) 12)
    )
  )

  ;; Agent2 travels from HaightAshbury to MissionDistrict (11 minutes)
  (:action travel-agent2-ha-to-md
    :parameters ()
    :precondition (at agent2 haightashbury)
    :effect (and
      (not (at agent2 haightashbury))
      (at agent2 missiondistrict)
      (increase (time) 11)
    )
  )

  ;; Agent2 meets Margaret for 30 minutes (satisfies "at least 30").
  (:action meet-agent2-margaret
    :parameters ()
    :precondition (and
      (at agent2 haightashbury)
      (visitor-at haightashbury)
      (not (met margaret))
      (>= (time) 480)
      (<= (+ (time) 30) 945)
    )
    :effect (and
      (met margaret)
      (increase (met-count) 1)
      (increase (time) 30)
    )
  )
)