(define (domain orchestrated-meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant meeting slot)
  (:constants katherine nicole kevin - participant)
  (:predicates
    (slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (free ?p - participant ?s - slot)
    (booked ?p - participant ?m - meeting ?s - slot)
    (meeting-scheduled ?m - meeting)
    (meeting-at ?m - meeting ?s - slot)
  )

  (:action book-katherine
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free katherine ?s1)
      (free katherine ?s2)
      (not (booked katherine ?m ?s1))
    )
    :effect (and
      (booked katherine ?m ?s1)
      (not (free katherine ?s1))
      (not (free katherine ?s2))
    )
  )

  (:action book-nicole
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free nicole ?s1)
      (free nicole ?s2)
      (not (booked nicole ?m ?s1))
    )
    :effect (and
      (booked nicole ?m ?s1)
      (not (free nicole ?s1))
      (not (free nicole ?s2))
    )
  )

  (:action book-kevin
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free kevin ?s1)
      (free kevin ?s2)
      (not (booked kevin ?m ?s1))
    )
    :effect (and
      (booked kevin ?m ?s1)
      (not (free kevin ?s1))
      (not (free kevin ?s2))
    )
  )

  (:action confirm-meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (booked katherine ?m ?s1)
      (booked nicole ?m ?s1)
      (booked kevin ?m ?s1)
      (not (meeting-scheduled ?m))
    )
    :effect (and
      (meeting-scheduled ?m)
      (meeting-at ?m ?s1)
    )
  )
)