(define (domain orchestrated-meeting)
  (:requirements :typing :negative-preconditions)
  (:types person slot meeting)

  (:predicates
    (busy ?p - person ?s - slot)
    (free ?s - slot)
    (confirmed ?p - person ?s - slot)
    (attendee ?m - meeting ?p - person)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (meeting-with ?p - person)
    (late ?s - slot)
    (occupied ?s - slot)
  )

  (:action confirm-brian
    :parameters (?s - slot)
    :precondition (and
                    (free ?s)
                    (not (busy brian ?s))
                  )
    :effect (confirmed brian ?s)
  )

  (:action confirm-billy-normal
    :parameters (?s - slot)
    :precondition (and
                    (free ?s)
                    (not (busy billy ?s))
                    (not (late ?s))
                  )
    :effect (confirmed billy ?s)
  )

  (:action confirm-billy-late
    :parameters (?s - slot)
    :precondition (and
                    (free ?s)
                    (not (busy billy ?s))
                    (late ?s)
                  )
    :effect (confirmed billy ?s)
  )

  (:action confirm-patricia
    :parameters (?s - slot)
    :precondition (and
                    (free ?s)
                    (not (busy patricia ?s))
                  )
    :effect (confirmed patricia ?s)
  )

  (:action finalize-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
                    (unscheduled ?m)
                    (free ?s)
                    (confirmed brian ?s)
                    (confirmed billy ?s)
                    (confirmed patricia ?s)
                    (attendee ?m brian)
                    (attendee ?m billy)
                    (attendee ?m patricia)
                    (not (meeting-scheduled))
                  )
    :effect (and
              (meeting-scheduled)
              (meeting-at ?s)
              (meeting-with brian)
              (meeting-with billy)
              (meeting-with patricia)
              (scheduled ?m ?s)
              (occupied ?s)
            )
  )
)