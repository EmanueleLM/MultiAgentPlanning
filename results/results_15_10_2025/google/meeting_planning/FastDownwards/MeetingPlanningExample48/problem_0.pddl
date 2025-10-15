(define (problem meet_joseph_problem)
  (:domain multiagent_meetings)
  (:objects)
  (:init
    ; you start at Financial District at 09:00 (540)
    (at_you_fd)
    ; Joseph is not declared present yet; joseph_appear must be applied when time within window
    ; numeric initializations:
    (= (time) 540)
    (= (meetings_count) 0)
    (= (meeting_time_total) 0)
  )
  ; Trivial goal: empty conjunction (planner will optimize metric)
  (:goal (and))
  ; Keep the same metric in the problem file
  (:metric maximize (meeting_time_total))
)