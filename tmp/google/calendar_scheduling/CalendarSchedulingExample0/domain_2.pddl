(define (domain combined-meeting-scheduling)
  (:requirements :strips :typing)
  (:types person time-slot)
  
  (:predicates 
    (free ?p - person ?t - time-slot)
    (meeting-scheduled)
    (next-slot ?current ?next - time-slot)
    (blocked ?p - person ?t - time-slot)
  )

  (:action schedule-meeting
    :parameters (?p - person ?start ?end - time-slot)
    :precondition (and
                   (next-slot ?start ?end)
                   (not (meeting-scheduled))
                 )
    :effect (meeting-scheduled)
  )
  
  (:action check-availability
    :parameters (?t - time-slot)
    :precondition (and 
                    (forall (?p - person) (free ?p ?t))
                    (not (meeting-scheduled))
                  )
    :effect (meeting-scheduled)
  )
)