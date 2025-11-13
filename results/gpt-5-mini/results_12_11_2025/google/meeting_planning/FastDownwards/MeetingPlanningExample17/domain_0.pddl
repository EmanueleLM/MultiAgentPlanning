(define (domain traveler-domain)
  ;; Domain for a single traveler agent who can stay, travel, and meet Matthew.
  ;; Time is modeled discretely with 15-minute timeslot objects.
  (:requirements :strips :typing :negative-preconditions)
  (:types location timeslot person)

  (:predicates
    ;; agent is at a location at a specific timeslot
    (at ?loc - location ?t - timeslot)
    ;; agent is in-transit during a timeslot (occupies that timeslot while traveling)
    (in-transit ?t - timeslot)
    ;; immediate successor relation between timeslots (15-minute steps)
    (next ?t1 - timeslot ?t2 - timeslot)
    ;; allowed directed travel route encoded as a chain of timeslots:
    ;; (travel-route from to depart s1 s2 s3 arrive)
    (travel-route ?from - location ?to - location ?td - timeslot ?s1 - timeslot ?s2 - timeslot ?s3 - timeslot ?ta - timeslot)
    ;; a meeting was started at a timeslot
    (meeting-started ?t - timeslot)
    ;; agent has met a person
    (met ?p - person)
    ;; static fact: a person (Matthew) is at a location at a timeslot
    (person-at ?p - person ?loc - location ?t - timeslot)
  )

  ;; Stay advances the agent one timeslot forward while remaining at the same location.
  (:action stay
    :parameters (?loc - location ?t - timeslot ?tnext - timeslot)
    :precondition (and (at ?loc ?t) (next ?t ?tnext))
    :effect (and
              (not (at ?loc ?t))
              (at ?loc ?tnext)
            )
  )

  ;; Directed travel that occupies a fixed chain of intermediate timeslots.
  ;; This generic action requires a travel-route fact describing the exact departure,
  ;; three intermediate 15-min timeslots, and the arrival timeslot. Effects mark the
  ;; intermediate slots as in-transit and place the agent at the arrival slot.
  ;; (The concrete route facts are provided in the problem instance.)
  (:action travel
    :parameters (?from - location ?to - location
                 ?td - timeslot ?s1 - timeslot ?s2 - timeslot ?s3 - timeslot ?ta - timeslot)
    :precondition (and
                    (at ?from ?td)
                    (travel-route ?from ?to ?td ?s1 ?s2 ?s3 ?ta)
                  )
    :effect (and
              (not (at ?from ?td))
              (in-transit ?s1)
              (in-transit ?s2)
              (in-transit ?s3)
              (at ?to ?ta)
            )
  )

  ;; Start the meeting at sunset_district at the meeting start timeslot.
  ;; Requires Matthew to be present at that timeslot. This records the meeting start.
  (:action start-meet
    :parameters (?t - timeslot ?tnext - timeslot ?p - person)
    :precondition (and
                    (at sunset_district ?t)
                    (person-at ?p sunset_district ?t)
                    (next ?t ?tnext)
                  )
    :effect (and
              (meeting-started ?t)
            )
  )

  ;; Finish the meeting after one 15-minute slot (i.e., next slot). Requires the agent
  ;; to still be at sunset_district and Matthew to be present at the finish slot.
  ;; Produces the completed meet fact.
  (:action finish-meet
    :parameters (?t - timeslot ?tnext - timeslot ?p - person)
    :precondition (and
                    (meeting-started ?t)
                    (next ?t ?tnext)
                    (at sunset_district ?tnext)
                    (person-at ?p sunset_district ?tnext)
                  )
    :effect (and
              (not (meeting-started ?t))
              (met ?p)
            )
  )
)