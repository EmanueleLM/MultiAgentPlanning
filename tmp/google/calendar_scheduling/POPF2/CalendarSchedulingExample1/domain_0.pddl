(define (domain schedule-meeting)
  (:requirements :strips :multi-agent)

  ;; Each agent has a distinct action to express their preferred meeting times
  (:action raymond-prefer
    :parameters (?time)
    :precondition (and (possible-time ?time) (not (raymond-preferred ?time)))
    :effect (raymond-preferred ?time))

  (:action billy-prefer
    :parameters (?time)
    :precondition (and (possible-time ?time) (not (billy-preferred ?time)))
    :effect (billy-preferred ?time))
  
  (:action donald-prefer
    :parameters (?time)
    :precondition (and (possible-time ?time) (not (donald-preferred ?time)))
    :effect (donald-preferred ?time))
  
  ;; General action for selecting a common meeting time
  (:action find-common-time
    :parameters (?time)
    :precondition (and
                    (raymond-preferred ?time)
                    (billy-preferred ?time)
                    (donald-preferred ?time))
    :effect (common-meeting-time ?time))
)