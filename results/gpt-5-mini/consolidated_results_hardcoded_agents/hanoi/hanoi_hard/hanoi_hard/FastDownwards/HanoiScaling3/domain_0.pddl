(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent step)

  (:predicates
    ; disk placement: disk directly on a place (peg or disk)
    (on ?d - disk ?p - place)
    ; no disk on top of this place (peg or disk)
    (clear ?p - place)
    ; agent identity predicates (static)
    (hanoi_player_agent ?a - agent)
    (auditor_agent ?a - agent)
    ; sequencing over discrete move-steps
    (current-step ?s - step)
    (step-successor ?s1 - step ?s2 - step)
    ; ordering relation: disk ?d is smaller than place ?p (either disk or peg)
    (smaller ?d - disk ?p - place)
  )

  ; Only the hanoi_player agent may execute physical moves. Actions are fully explicit and
  ; consume a single step token and produce the successor step token so moves are strictly ordered.
  (:action move
    :parameters (?a - agent
                 ?d - disk
                 ?from - place
                 ?to - place
                 ?s - step
                 ?s2 - step)
    :precondition (and
      (hanoi_player_agent ?a)         ; only the designated player may move disks
      (on ?d ?from)                   ; disk is directly on its supporting place
      (clear ?d)                      ; disk is the top disk on its support
      (clear ?to)                     ; target place has no disk on top (can accept this disk)
      (smaller ?d ?to)                ; size constraint: disk must be smaller than target place
      (current-step ?s)               ; enforce current step
      (step-successor ?s ?s2)         ; ensure successor step provided
      (not (= ?from ?to))             ; move must change location
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)                   ; after removing top disk, the support becomes clear
      (not (clear ?to))               ; target is no longer clear because the disk sits on it
      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)