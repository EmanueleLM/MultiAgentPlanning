(define (domain meet_friends_sf)
  (:requirements :strips :typing :negative-preconditions)

  (:types 
    location person stage)

  (:predicates 
    (at ?person - person ?location - location)
    (visited ?person - person)
    (stage_reached ?stage - stage)
  )

  ;; Movement actions between locations
  (:action move_pacific_to_wharf_stage1
    :parameters ()
    :precondition (and 
      (at you pacific_heights)
      (stage_reached stage_t1)   ;; Start at t1 stage
    )
    :effect (and
      (not (at you pacific_heights))
      (at you fishermans_wharf)
      (not (stage_reached stage_t1))
      (stage_reached stage_t2)   ;; Arrive at wharf moving to t2 stage
    )
  )

  ;; Action to initiate meeting
  (:action start_meeting_betty_stage2
    :parameters ()
    :precondition (and 
      (at you fishermans_wharf)
      (at betty fishermans_wharf)
      (stage_reached stage_t2)  ;; Start meeting at t2 stage
    )
    :effect (and 
      (not (stage_reached stage_t2))
      (stage_reached stage_t3)
    )
  )

  ;; Action to conclude meeting
  (:action complete_meeting_betty
    :parameters ()
    :precondition (and 
      (stage_reached stage_t3)  ;; Ensure having met Betty for two stages
    )
    :effect (and
      (visited betty)
    )
  )
)