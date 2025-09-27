(define (domain meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :equality :action-costs :quantified-preconditions)
  (:types person slot)
  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    (before ?s1 - slot ?s2 - slot)
    (free ?p - person ?s - slot)
    (chosen ?s - slot)
  )
  (:action select-09-00
    :parameters ()
    :precondition (and
      (slot slot-09-00)
      (forall (?p - person) (free ?p slot-09-00))
      (not (exists (?t - slot) (and (before ?t slot-09-00) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-09-00))
    :cost 0
  )
  (:action select-09-30
    :parameters ()
    :precondition (and
      (slot slot-09-30)
      (forall (?p - person) (free ?p slot-09-30))
      (not (exists (?t - slot) (and (before ?t slot-09-30) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-09-30))
    :cost 1
  )
  (:action select-10-00
    :parameters ()
    :precondition (and
      (slot slot-10-00)
      (forall (?p - person) (free ?p slot-10-00))
      (not (exists (?t - slot) (and (before ?t slot-10-00) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-10-00))
    :cost 2
  )
  (:action select-10-30
    :parameters ()
    :precondition (and
      (slot slot-10-30)
      (forall (?p - person) (free ?p slot-10-30))
      (not (exists (?t - slot) (and (before ?t slot-10-30) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-10-30))
    :cost 3
  )
  (:action select-11-00
    :parameters ()
    :precondition (and
      (slot slot-11-00)
      (forall (?p - person) (free ?p slot-11-00))
      (not (exists (?t - slot) (and (before ?t slot-11-00) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-11-00))
    :cost 4
  )
  (:action select-11-30
    :parameters ()
    :precondition (and
      (slot slot-11-30)
      (forall (?p - person) (free ?p slot-11-30))
      (not (exists (?t - slot) (and (before ?t slot-11-30) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-11-30))
    :cost 5
  )
  (:action select-12-00
    :parameters ()
    :precondition (and
      (slot slot-12-00)
      (forall (?p - person) (free ?p slot-12-00))
      (not (exists (?t - slot) (and (before ?t slot-12-00) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-12-00))
    :cost 6
  )
  (:action select-12-30
    :parameters ()
    :precondition (and
      (slot slot-12-30)
      (forall (?p - person) (free ?p slot-12-30))
      (not (exists (?t - slot) (and (before ?t slot-12-30) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-12-30))
    :cost 7
  )
  (:action select-13-00
    :parameters ()
    :precondition (and
      (slot slot-13-00)
      (forall (?p - person) (free ?p slot-13-00))
      (not (exists (?t - slot) (and (before ?t slot-13-00) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-13-00))
    :cost 8
  )
  (:action select-13-30
    :parameters ()
    :precondition (and
      (slot slot-13-30)
      (forall (?p - person) (free ?p slot-13-30))
      (not (exists (?t - slot) (and (before ?t slot-13-30) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-13-30))
    :cost 9
  )
  (:action select-14-00
    :parameters ()
    :precondition (and
      (slot slot-14-00)
      (forall (?p - person) (free ?p slot-14-00))
      (not (exists (?t - slot) (and (before ?t slot-14-00) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-14-00))
    :cost 10
  )
  (:action select-14-30
    :parameters ()
    :precondition (and
      (slot slot-14-30)
      (forall (?p - person) (free ?p slot-14-30))
      (not (exists (?t - slot) (and (before ?t slot-14-30) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-14-30))
    :cost 11
  )
  (:action select-15-00
    :parameters ()
    :precondition (and
      (slot slot-15-00)
      (forall (?p - person) (free ?p slot-15-00))
      (not (exists (?t - slot) (and (before ?t slot-15-00) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-15-00))
    :cost 12
  )
  (:action select-15-30
    :parameters ()
    :precondition (and
      (slot slot-15-30)
      (forall (?p - person) (free ?p slot-15-30))
      (not (exists (?t - slot) (and (before ?t slot-15-30) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-15-30))
    :cost 13
  )
  (:action select-16-00
    :parameters ()
    :precondition (and
      (slot slot-16-00)
      (forall (?p - person) (free ?p slot-16-00))
      (not (exists (?t - slot) (and (before ?t slot-16-00) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-16-00))
    :cost 14
  )
  (:action select-16-30
    :parameters ()
    :precondition (and
      (slot slot-16-30)
      (forall (?p - person) (free ?p slot-16-30))
      (not (exists (?t - slot) (and (before ?t slot-16-30) (forall (?p - person) (free ?p ?t)))))
    )
    :effect (and (chosen slot-16-30))
    :cost 15
  )
)