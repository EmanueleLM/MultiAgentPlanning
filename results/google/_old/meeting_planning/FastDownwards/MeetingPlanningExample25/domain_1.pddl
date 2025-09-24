(define (domain multi-agent-meeting)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (travel ?from - location ?to - location)
    (span23 ?t1 - time ?t2 - time)
    (span105 ?t1 - time ?t2 - time)
    (waitable ?t1 - time ?t2 - time)
    (available ?a - agent ?t - time)
    (met)
  )

  ;; Generic move actions for each agent that consume exactly the 23-minute travel span.
  (:action you_move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
                    (at you ?from ?t1)
                    (travel ?from ?to)
                    (span23 ?t1 ?t2)
                  )
    :effect (and
              (not (at you ?from ?t1))
              (at you ?to ?t2)
            )
    :cost 23
  )

  (:action david_move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
                    (at david ?from ?t1)
                    (travel ?from ?to)
                    (span23 ?t1 ?t2)
                  )
    :effect (and
              (not (at david ?from ?t1))
              (at david ?to ?t2)
            )
    :cost 23
  )

  ;; Explicit wait actions for the discrete time intervals used in the problem.
  ;; These are instantaneous (in STRIPS terms) but carry a cost equal to the
  ;; length of the interval they model so minimizing cost corresponds to
  ;; minimizing elapsed time.
  (:action you_wait_563_960
    :precondition (and (at you ?loc - location t563) (waitable t563 t960))
    :effect (and (not (at you ?loc t563)) (at you ?loc t960))
    :cost 397
  )
  (:action you_wait_960_1065
    :precondition (and (at you ?loc - location t960) (waitable t960 t1065))
    :effect (and (not (at you ?loc t960)) (at you ?loc t1065))
    :cost 105
  )
  (:action you_wait_1065_1200
    :precondition (and (at you ?loc - location t1065) (waitable t1065 t1200))
    :effect (and (not (at you ?loc t1065)) (at you ?loc t1200))
    :cost 135
  )
  (:action you_wait_1200_1305
    :precondition (and (at you ?loc - location t1200) (waitable t1200 t1305))
    :effect (and (not (at you ?loc t1200)) (at you ?loc t1305))
    :cost 105
  )

  (:action david_wait_960_1065
    :precondition (and (at david ?loc - location t960) (waitable t960 t1065))
    :effect (and (not (at david ?loc t960)) (at david ?loc t1065))
    :cost 105
  )
  (:action david_wait_1065_1200
    :precondition (and (at david ?loc - location t1065) (waitable t1065 t1200))
    :effect (and (not (at david ?loc t1065)) (at david ?loc t1200))
    :cost 135
  )
  (:action david_wait_1200_1305
    :precondition (and (at david ?loc - location t1200) (waitable t1200 t1305))
    :effect (and (not (at david ?loc t1200)) (at david ?loc t1305))
    :cost 105
  )

  ;; Meeting actions: allow meeting to start at any span105 interval, require both agents
  ;; to be co-located at the meeting start time and to have availability for the span.
  (:action meet_you_david
    :parameters (?loc - location ?tstart - time ?tend - time)
    :precondition (and
                    (at you ?loc ?tstart)
                    (at david ?loc ?tstart)
                    (span105 ?tstart ?tend)
                    (available you ?tstart)
                    (available david ?tstart)
                    (available you ?tend)
                    (available david ?tend)
                  )
    :effect (and
              (met)
              ;; Move both agents' presence forward to the meeting end time to reflect
              ;; that they are occupied for the duration.
              (not (at you ?loc ?tstart))
              (at you ?loc ?tend)
              (not (at david ?loc ?tstart))
              (at david ?loc ?tend)
            )
    :cost 105
  )
)