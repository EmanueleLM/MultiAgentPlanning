(define (domain block-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    ;; physical state
    (on ?b - object ?p - object)        ; block ?b is on place ?p (place can be table or another block)
    (clear ?o - object)                 ; top of object/place is clear
    (handempty)                         ; gripper is empty
    (holding ?b - object)               ; gripper holds block ?b
    (attached ?b - object)              ; block ?b attached to gripper (synonym for holding in low-level model)

    ;; sensing / planning phases
    (sensors_ok)                        ; sensors operational
    (scene_perceived)                   ; Perceive_scene completed
    (plan_computed)                     ; Validate_goal_and_extract_plan completed

    ;; goal and plan bookkeeping (explicit, not penalties)
    (goal_on ?b - object ?p - object)   ; stated goal: ?b must be on ?p in final arrangement
    (move_pending ?b - object ?p - object) ; a planned move: move block ?b to place ?p is pending execution
    (awaiting_verification ?b - object ?p - object) ; a recent place requires verification
    (verified ?b - object)              ; a placed block has been verified stable
  )

  ;; Perceive scene: must run first (sensors_ok must be true in initial state).
  (:action perceive_scene
    :parameters ()
    :precondition (and (sensors_ok) (not (scene_perceived)))
    :effect (and (scene_perceived))
  )

  ;; Validate goal and extract plan: create explicit move_pending facts for any goal that is not already satisfied.
  ;; This action is generic: it creates a pending move for one goal pair (?b ?p) when the goal requires it and it is not already satisfied.
  ;; It also sets plan_computed to enforce ordering (no motion before planning).
  (:action validate_and_plan
    :parameters (?b - object ?p - object)
    :precondition (and
                   (scene_perceived)
                   (goal_on ?b ?p)
                   (not (on ?b ?p))    ; plan only for unsatisfied goals
                   (not (plan_computed)))
    :effect (and
             (plan_computed)
             (move_pending ?b ?p))
  )

  ;; Unstack: remove a block from on-top-of another block and hold it.
  (:action unstack
    :parameters (?b - object ?from - object ?to - object)
    :precondition (and
                   (plan_computed)
                   (on ?b ?from)
                   (clear ?b)
                   (handempty)
                   (move_pending ?b ?to))
    :effect (and
             (not (on ?b ?from))
             (not (clear ?b))
             (holding ?b)
             (attached ?b)
             (not (handempty))
             (clear ?from))
  )

  ;; Pickup from table: pick a block that is on the table.
  (:action pickup_from_table
    :parameters (?b - object ?to - object)
    :precondition (and
                   (plan_computed)
                   (on ?b table)
                   (clear ?b)
                   (handempty)
                   (move_pending ?b ?to))
    :effect (and
             (not (on ?b table))
             (not (clear ?b))
             (holding ?b)
             (attached ?b)
             (not (handempty)))
  )

  ;; Stack: place a held block onto another block (block-to-block placement).
  ;; After placement, an awaiting_verification fact is created and the placement must be verified before the move is considered finished.
  (:action stack_onto
    :parameters (?b - object ?to - object)
    :precondition (and
                   (plan_computed)
                   (holding ?b)
                   (clear ?to)
                   (move_pending ?b ?to))
    :effect (and
             (not (holding ?b))
             (not (attached ?b))
             (on ?b ?to)
             (clear ?b)
             (not (clear ?to))
             (handempty)
             (awaiting_verification ?b ?to))
  )

  ;; Put down onto table: place a held block onto the table.
  (:action putdown_on_table
    :parameters (?b - object ?to - object)  ; ?to expected to be table in usage
    :precondition (and
                   (plan_computed)
                   (holding ?b)
                   (move_pending ?b ?to)
                   (not (on ?b ?to)))   ; ensure not already there
    :effect (and
             (not (holding ?b))
             (not (attached ?b))
             (on ?b ?to)
             (clear ?b)
             (handempty)
             (awaiting_verification ?b ?to))
  )

  ;; Verify and stabilize: confirm the placed block is at intended pose and stable.
  ;; Successful verification removes the move_pending marker and clears awaiting_verification.
  (:action verify_and_stabilize
    :parameters (?b - object ?to - object)
    :precondition (and
                   (plan_computed)
                   (awaiting_verification ?b ?to)
                   (on ?b ?to))
    :effect (and
             (not (awaiting_verification ?b ?to))
             (verified ?b)
             (not (move_pending ?b ?to)))
  )

  ;; Post-check: assert all planned moves are finished by verifying the specific block(s) involved.
  ;; This action is parameterized; use it in the problem to require a final verification step for each planned block.
  (:action post_check_goal_for_block
    :parameters (?b - object ?p - object)
    :precondition (and
                   (plan_computed)
                   (verified ?b)
                   (on ?b ?p))
    :effect ())
)