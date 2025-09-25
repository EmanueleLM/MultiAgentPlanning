(define (domain multi-agent-meeting)
  (:requirements :strips :typing :negative-preconditions :action-costs)
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

  (:action move
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from ?t1) (travel ?from ?to) (span23 ?t1 ?t2))
    :effect (and (not (at ?a ?from ?t1)) (at ?a ?to ?t2))
    :cost 23
  )

  (:action wait_t563_t960
    :parameters (?a - agent ?loc - location)
    :precondition (and (at ?a ?loc t563) (waitable t563 t960))
    :effect (and (not (at ?a ?loc t563)) (at ?a ?loc t960))
    :cost 397
  )

  (:action wait_t960_t1065
    :parameters (?a - agent ?loc - location)
    :precondition (and (at ?a ?loc t960) (waitable t960 t1065))
    :effect (and (not (at ?a ?loc t960)) (at ?a ?loc t1065))
    :cost 105
  )

  (:action wait_t1065_t1200
    :parameters (?a - agent ?loc - location)
    :precondition (and (at ?a ?loc t1065) (waitable t1065 t1200))
    :effect (and (not (at ?a ?loc t1065)) (at ?a ?loc t1200))
    :cost 135
  )

  (:action wait_t1200_t1305
    :parameters (?a - agent ?loc - location)
    :precondition (and (at ?a ?loc t1200) (waitable t1200 t1305))
    :effect (and (not (at ?a ?loc t1200)) (at ?a ?loc t1305))
    :cost 105
  )

  (:action meet
    :parameters (?a1 - agent ?a2 - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
                    (at ?a1 ?loc ?tstart)
                    (at ?a2 ?loc ?tstart)
                    (span105 ?tstart ?tend)
                    (available ?a1 ?tstart)
                    (available ?a2 ?tstart)
                    (available ?a1 ?tend)
                    (available ?a2 ?tend)
                  )
    :effect (and
              (met)
              (not (at ?a1 ?loc ?tstart))
              (at ?a1 ?loc ?tend)
              (not (at ?a2 ?loc ?tstart))
              (at ?a2 ?loc ?tend)
            )
    :cost 105
  )
)