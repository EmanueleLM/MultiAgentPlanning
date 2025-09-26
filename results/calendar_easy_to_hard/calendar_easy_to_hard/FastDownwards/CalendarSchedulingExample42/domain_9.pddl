(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :equality :action-costs)
  (:types person time)
  (:constants
    samantha brian arthur matthew marilyn mark andrea - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )
  (:predicates
    (available ?p - person ?t - time)
    (proposed ?t - time)
    (chosen)
    (attending ?p - person)
    (in-work ?t - time)
  )

  (:action set-proposed-t0
    :precondition (and (not (chosen)) (in-work t0))
    :effect (and (proposed t0) (chosen))
    :cost 0
  )
  (:action set-proposed-t1
    :precondition (and (not (chosen)) (in-work t1))
    :effect (and (proposed t1) (chosen))
    :cost 1
  )
  (:action set-proposed-t2
    :precondition (and (not (chosen)) (in-work t2))
    :effect (and (proposed t2) (chosen))
    :cost 2
  )
  (:action set-proposed-t3
    :precondition (and (not (chosen)) (in-work t3))
    :effect (and (proposed t3) (chosen))
    :cost 3
  )
  (:action set-proposed-t4
    :precondition (and (not (chosen)) (in-work t4))
    :effect (and (proposed t4) (chosen))
    :cost 4
  )
  (:action set-proposed-t5
    :precondition (and (not (chosen)) (in-work t5))
    :effect (and (proposed t5) (chosen))
    :cost 5
  )
  (:action set-proposed-t6
    :precondition (and (not (chosen)) (in-work t6))
    :effect (and (proposed t6) (chosen))
    :cost 6
  )
  (:action set-proposed-t7
    :precondition (and (not (chosen)) (in-work t7))
    :effect (and (proposed t7) (chosen))
    :cost 7
  )
  (:action set-proposed-t8
    :precondition (and (not (chosen)) (in-work t8))
    :effect (and (proposed t8) (chosen))
    :cost 8
  )
  (:action set-proposed-t9
    :precondition (and (not (chosen)) (in-work t9))
    :effect (and (proposed t9) (chosen))
    :cost 9
  )
  (:action set-proposed-t10
    :precondition (and (not (chosen)) (in-work t10))
    :effect (and (proposed t10) (chosen))
    :cost 10
  )
  (:action set-proposed-t11
    :precondition (and (not (chosen)) (in-work t11))
    :effect (and (proposed t11) (chosen))
    :cost 11
  )
  (:action set-proposed-t12
    :precondition (and (not (chosen)) (in-work t12))
    :effect (and (proposed t12) (chosen))
    :cost 12
  )
  (:action set-proposed-t13
    :precondition (and (not (chosen)) (in-work t13))
    :effect (and (proposed t13) (chosen))
    :cost 13
  )
  (:action set-proposed-t14
    :precondition (and (not (chosen)) (in-work t14))
    :effect (and (proposed t14) (chosen))
    :cost 14
  )
  (:action set-proposed-t15
    :precondition (and (not (chosen)) (in-work t15))
    :effect (and (proposed t15) (chosen))
    :cost 15
  )

  (:action attend-samantha
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available samantha ?t) (not (attending samantha)))
    :effect (attending samantha)
    :cost 0
  )

  (:action attend-brian
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available brian ?t) (not (attending brian)))
    :effect (attending brian)
    :cost 0
  )

  (:action attend-arthur
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available arthur ?t) (not (attending arthur)))
    :effect (attending arthur)
    :cost 0
  )

  (:action attend-matthew
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available matthew ?t) (not (attending matthew)))
    :effect (attending matthew)
    :cost 0
  )

  (:action attend-marilyn
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available marilyn ?t) (not (attending marilyn)))
    :effect (attending marilyn)
    :cost 0
  )

  (:action attend-mark
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available mark ?t) (not (attending mark)))
    :effect (attending mark)
    :cost 0
  )

  (:action attend-andrea
    :parameters (?t - time)
    :precondition (and (proposed ?t) (available andrea ?t) (not (attending andrea)))
    :effect (attending andrea)
    :cost 0
  )
)