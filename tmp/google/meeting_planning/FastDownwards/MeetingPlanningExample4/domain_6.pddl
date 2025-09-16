(define (domain integrated_meeting_schedule)
  (:requirements :strips :typing)

  (:types location person time)

  (:predicates
    (at ?person - person ?loc - location)
    (meeting_window ?person - person ?start - time ?end - time)
    (current_time ?time - time)
    (travel_time ?from - location ?to - location ?duration - time)
    (meeting_duration ?person - person ?duration - time)
    (meeting_complete)
  )

  ;; Visitor Actions (Agent 1)
  (:action visitor-travel
    :parameters (?from - location ?to - location ?start_time - time)
    :precondition (and 
      (at visitor ?from)
      (current_time ?start_time)
      (travel_time ?from ?to ?duration)
    )
    :effect (and 
      (not (at visitor ?from))
      (at visitor ?to)
      (current_time ?end_time)
    )
  )

  (:action visitor-meet
    :parameters (?person - person ?loc - location ?start_time - time ?duration - time)
    :precondition (and
      (at visitor ?loc)
      (at ?person ?loc)
      (meeting_window ?person ?window_start ?window_end)
      (>= ?start_time ?window_start)
      (<= (+ ?start_time ?duration) ?window_end)
      (>= ?duration (meeting_duration visitor ?person))
    )
    :effect meeting_complete
  )

  ;; Jessica only needs presence and time window
  ;; Orchestrator must ensure time constraints
)