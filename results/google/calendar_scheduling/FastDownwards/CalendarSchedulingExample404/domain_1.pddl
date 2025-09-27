(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant timeslot)
  (:constants kayla sandra ryan kathleen walter arthur heather - participant)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (confirmed ?p - participant ?t - timeslot)
    (scheduled ?t - timeslot)
  )

  (:action confirm-kayla
    :parameters (?t - timeslot)
    :precondition (available kayla ?t)
    :effect (confirmed kayla ?t)
  )

  (:action confirm-sandra
    :parameters (?t - timeslot)
    :precondition (available sandra ?t)
    :effect (confirmed sandra ?t)
  )

  (:action confirm-ryan
    :parameters (?t - timeslot)
    :precondition (available ryan ?t)
    :effect (confirmed ryan ?t)
  )

  (:action confirm-kathleen
    :parameters (?t - timeslot)
    :precondition (available kathleen ?t)
    :effect (confirmed kathleen ?t)
  )

  (:action confirm-walter
    :parameters (?t - timeslot)
    :precondition (available walter ?t)
    :effect (confirmed walter ?t)
  )

  (:action confirm-arthur
    :parameters (?t - timeslot)
    :precondition (available arthur ?t)
    :effect (confirmed arthur ?t)
  )

  (:action confirm-heather
    :parameters (?t - timeslot)
    :precondition (available heather ?t)
    :effect (confirmed heather ?t)
  )

  (:action finalize
    :parameters (?t - timeslot)
    :precondition (and
      (confirmed kayla ?t)
      (confirmed sandra ?t)
      (confirmed ryan ?t)
      (confirmed kathleen ?t)
      (confirmed walter ?t)
      (confirmed arthur ?t)
      (confirmed heather ?t)
    )
    :effect (scheduled ?t)
  )
)