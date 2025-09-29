(define (domain friends-meeting-classical)
  (:requirements :typing :negative-preconditions :equality)
  (:types agent location time)
  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (met ?ag - agent)
    (next ?t1 - time ?t2 - time)
    (travel-slot ?from - location ?to - location ?t1 - time ?t2 - time)
    (deborah-available ?ts - time ?te - time)
    (meeting-slot ?ts - time ?te - time)
  )

  (:action travel
    :parameters (?ag - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?from ?t1)
      (travel-slot ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag ?from ?t1))
      (at ?ag ?to ?t2)
    )
  )

  (:action wait
    :parameters (?ag - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?loc ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag ?loc ?t1))
      (at ?ag ?loc ?t2)
    )
  )

  (:action meet-deborah
    :parameters (?you - agent ?deb - agent ?loc - location ?ts - time ?te - time)
    :precondition (and
      (at ?you ?loc ?ts)
      (at ?deb ?loc ?ts)
      (deborah-available ?ts ?te)
      (meeting-slot ?ts ?te)
      (not (met ?deb))
    )
    :effect (and
      (not (at ?you ?loc ?ts))
      (at ?you ?loc ?te)
      (met ?deb)
    )
  )
)