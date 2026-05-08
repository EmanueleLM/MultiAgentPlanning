(define (domain meeting-planning)
  (:requirements :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?loc - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel-edge ?t1 - time ?t2 - time)
    (meeting-allowed ?t1 - time ?t2 - time)
    (meeting-done)
  )

  (:action wait
    :parameters (?who - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at ?who ?loc ?t1) (next ?t1 ?t2))
    :effect (and (at ?who ?loc ?t2) (not (at ?who ?loc ?t1)))
  )

  (:action travel
    :parameters (?who - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?who ?from ?t1) (travel-edge ?t1 ?t2))
    :effect (and (at ?who ?to ?t2) (not (at ?who ?from ?t1)))
  )

  (:action meet-with-david
    :parameters (?who - agent ?loc - location ?start - time ?end - time)
    :precondition (and
                   (at ?who ?loc ?start)
                   (at ?who ?loc ?end)
                   (at david ?loc ?start)
                   (at david ?loc ?end)
                   (meeting-allowed ?start ?end)
                  )
    :effect (and (meeting-done))
  )
)