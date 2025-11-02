(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person time)
  (:constants samantha brian arthur matthew marilyn mark andrea - person)
  (:predicates
    (available ?p - person ?t - time)
    (proposed ?t - time)
    (chosen)
    (attending ?p - person)
  )

  (:action set-proposed-t0
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t0) (chosen))
    :cost 0
  )
  (:action set-proposed-t1
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t1) (chosen))
    :cost 1
  )
  (:action set-proposed-t2
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t2) (chosen))
    :cost 2
  )
  (:action set-proposed-t3
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t3) (chosen))
    :cost 3
  )
  (:action set-proposed-t4
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t4) (chosen))
    :cost 4
  )
  (:action set-proposed-t5
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t5) (chosen))
    :cost 5
  )
  (:action set-proposed-t6
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t6) (chosen))
    :cost 6
  )
  (:action set-proposed-t7
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t7) (chosen))
    :cost 7
  )
  (:action set-proposed-t8
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t8) (chosen))
    :cost 8
  )
  (:action set-proposed-t9
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t9) (chosen))
    :cost 9
  )
  (:action set-proposed-t10
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t10) (chosen))
    :cost 10
  )
  (:action set-proposed-t11
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t11) (chosen))
    :cost 11
  )
  (:action set-proposed-t12
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t12) (chosen))
    :cost 12
  )
  (:action set-proposed-t13
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t13) (chosen))
    :cost 13
  )
  (:action set-proposed-t14
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t14) (chosen))
    :cost 14
  )
  (:action set-proposed-t15
    :parameters ()
    :precondition (not (chosen))
    :effect (and (proposed t15) (chosen))
    :cost 15
  )

  (:action attend-samantha
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available samantha ?t) (not (attending samantha)))
    :effect (attending samantha)
  )

  (:action attend-brian
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available brian ?t) (not (attending brian)))
    :effect (attending brian)
  )

  (:action attend-arthur
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available arthur ?t) (not (attending arthur)))
    :effect (attending arthur)
  )

  (:action attend-matthew
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available matthew ?t) (not (attending matthew)))
    :effect (attending matthew)
  )

  (:action attend-marilyn
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available marilyn ?t) (not (attending marilyn)))
    :effect (attending marilyn)
  )

  (:action attend-mark
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available mark ?t) (not (attending mark)))
    :effect (attending mark)
  )

  (:action attend-andrea
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available andrea ?t) (not (attending andrea)))
    :effect (attending andrea)
  )
)