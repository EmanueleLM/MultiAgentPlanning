(define (domain traveler-domain)
  ;; Domain for a single traveler. Time is modeled as discrete 1-minute timeslots.
  ;; Requirements: plain STRIPS with typing and negative preconditions.
  (:requirements :strips :typing :negative-preconditions)

  (:types location timeslot person)

  (:predicates
    ;; agent location at a given timeslot
    (at ?loc - location ?t - timeslot)
    ;; in-transit during a timeslot
    (in-transit ?t - timeslot)
    ;; immediate successor relation between minute timeslots
    (next ?t1 - timeslot ?t2 - timeslot)
    ;; directed travel route specifying a departure timeslot and 16 successive timeslots
    ;; travel-route ?from ?to ?td ?s1 ?s2 ... ?s16
    (travel-route ?from - location ?to - location
                  ?td - timeslot ?s1 - timeslot ?s2 - timeslot ?s3 - timeslot
                  ?s4 - timeslot ?s5 - timeslot ?s6 - timeslot ?s7 - timeslot
                  ?s8 - timeslot ?s9 - timeslot ?s10 - timeslot ?s11 - timeslot
                  ?s12 - timeslot ?s13 - timeslot ?s14 - timeslot ?s15 - timeslot
                  ?s16 - timeslot)
    ;; a meeting was started at a timeslot
    (meeting-started ?t - timeslot)
    ;; agent has met a person
    (met ?p - person)
    ;; static fact: a person is at a location at a timeslot
    (person-at ?p - person ?loc - location ?t - timeslot)
  )

  ;; Wait one minute (advance via next relation) while remaining at same location.
  (:action stay
    :parameters (?loc - location ?t - timeslot ?tnext - timeslot)
    :precondition (and (at ?loc ?t) (next ?t ?tnext))
    :effect (and
              (not (at ?loc ?t))
              (at ?loc ?tnext)
            )
  )

  ;; Directed travel that consumes 16 minutes: depart at ?td, then 16 successive timeslots
  ;; ?s1..?s16 (where ?s16 is the arrival timeslot). The travel-route fact ties the exact chain.
  ;; Effects mark the first 15 of the successive timeslots as in-transit and place the agent at the arrival timeslot ?s16.
  (:action travel
    :parameters (?from - location ?to - location
                 ?td - timeslot
                 ?s1 - timeslot ?s2 - timeslot ?s3 - timeslot ?s4 - timeslot
                 ?s5 - timeslot ?s6 - timeslot ?s7 - timeslot ?s8 - timeslot
                 ?s9 - timeslot ?s10 - timeslot ?s11 - timeslot ?s12 - timeslot
                 ?s13 - timeslot ?s14 - timeslot ?s15 - timeslot ?s16 - timeslot)
    :precondition (and
                    (at ?from ?td)
                    (travel-route ?from ?to ?td ?s1 ?s2 ?s3 ?s4 ?s5 ?s6 ?s7 ?s8
                                  ?s9 ?s10 ?s11 ?s12 ?s13 ?s14 ?s15 ?s16)
                  )
    :effect (and
              (not (at ?from ?td))
              (in-transit ?s1)
              (in-transit ?s2)
              (in-transit ?s3)
              (in-transit ?s4)
              (in-transit ?s5)
              (in-transit ?s6)
              (in-transit ?s7)
              (in-transit ?s8)
              (in-transit ?s9)
              (in-transit ?s10)
              (in-transit ?s11)
              (in-transit ?s12)
              (in-transit ?s13)
              (in-transit ?s14)
              (in-transit ?s15)
              ;; arrival at the 16th successive timeslot
              (at ?to ?s16)
            )
  )

  ;; Start a meeting at a timeslot (requires the agent and person present at that same timeslot).
  (:action start-meet
    :parameters (?t - timeslot ?p - person ?loc - location)
    :precondition (and
                    (at ?loc ?t)
                    (person-at ?p ?loc ?t)
                  )
    :effect (and
              (meeting-started ?t)
            )
  )

  ;; Finish a meeting after exactly 15 minutes.
  ;; This action requires a chain of 15 next relations from ?t to ?tend (i.e., tend = t + 15 minutes),
  ;; the agent still at the meeting location at the finish, and the person present at the finish.
  (:action finish-meet
    :parameters (?t - timeslot ?t1 - timeslot ?t2 - timeslot ?t3 - timeslot ?t4 - timeslot
                 ?t5 - timeslot ?t6 - timeslot ?t7 - timeslot ?t8 - timeslot
                 ?t9 - timeslot ?t10 - timeslot ?t11 - timeslot ?t12 - timeslot
                 ?t13 - timeslot ?t14 - timeslot ?tend - timeslot
                 ?p - person ?loc - location)
    :precondition (and
                    (meeting-started ?t)
                    ;; chain of 15 minute-successor relations: ?t -> ?t1 -> ... -> ?tend
                    (next ?t ?t1) (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4)
                    (next ?t4 ?t5) (next ?t5 ?t6) (next ?t6 ?t7) (next ?t7 ?t8)
                    (next ?t8 ?t9) (next ?t9 ?t10) (next ?t10 ?t11) (next ?t11 ?t12)
                    (next ?t12 ?t13) (next ?t13 ?t14) (next ?t14 ?tend)
                    ;; agent and person present at meeting location at finish
                    (at ?loc ?tend)
                    (person-at ?p ?loc ?tend)
                  )
    :effect (and
              (not (meeting-started ?t))
              (met ?p)
            )
  )
)