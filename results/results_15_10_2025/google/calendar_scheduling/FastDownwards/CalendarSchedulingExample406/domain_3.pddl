(define (domain meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :existential-preconditions :universal-preconditions :action-costs)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (required ?p - person)
    (chosen ?s - slot)
    (attend ?p - person ?s - slot)
    (scheduled ?s - slot)
    (index0 ?s - slot) (index1 ?s - slot) (index2 ?s - slot) (index3 ?s - slot)
    (index4 ?s - slot) (index5 ?s - slot) (index6 ?s - slot) (index7 ?s - slot)
    (index8 ?s - slot) (index9 ?s - slot) (index10 ?s - slot) (index11 ?s - slot)
    (index12 ?s - slot) (index13 ?s - slot) (index14 ?s - slot) (index15 ?s - slot)
  )
  (:functions (total-cost))

  (:action choose-s0
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s0))
    :cost 0
  )

  (:action choose-s1
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s1))
    :cost 1
  )

  (:action choose-s2
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s2))
    :cost 2
  )

  (:action choose-s3
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s3))
    :cost 3
  )

  (:action choose-s4
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s4))
    :cost 4
  )

  (:action choose-s5
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s5))
    :cost 5
  )

  (:action choose-s6
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s6))
    :cost 6
  )

  (:action choose-s7
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s7))
    :cost 7
  )

  (:action choose-s8
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s8))
    :cost 8
  )

  (:action choose-s9
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s9))
    :cost 9
  )

  (:action choose-s10
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s10))
    :cost 10
  )

  (:action choose-s11
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s11))
    :cost 11
  )

  (:action choose-s12
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s12))
    :cost 12
  )

  (:action choose-s13
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s13))
    :cost 13
  )

  (:action choose-s14
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s14))
    :cost 14
  )

  (:action choose-s15
    :parameters ()
    :precondition (not (exists (?x - slot) (scheduled ?x)))
    :effect (and (chosen s15))
    :cost 15
  )

  (:action join
    :parameters (?p - person ?s - slot)
    :precondition (and (chosen ?s) (free ?p ?s))
    :effect (attend ?p ?s)
    :cost 0
  )

  (:action confirm
    :parameters (?s - slot)
    :precondition (and (chosen ?s)
                       (forall (?p - person)
                         (imply (required ?p) (attend ?p ?s))))
    :effect (and (scheduled ?s) (not (chosen ?s)))
    :cost 0
  )
)