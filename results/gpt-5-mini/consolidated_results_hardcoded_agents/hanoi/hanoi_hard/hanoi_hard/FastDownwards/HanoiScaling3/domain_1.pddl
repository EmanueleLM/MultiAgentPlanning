(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent step)

  (:predicates
    (on ?d - disk ?p - place)            ; disk directly on place (peg or disk)
    (clear ?p - place)                   ; nothing directly on this place (peg or disk)
    (hanoi_player_agent ?a - agent)      ; identifies the moving agent
    (auditor_agent ?a - agent)           ; auditor identity (static)
    (current-step ?s - step)             ; current discrete step token
    (step-successor ?s1 - step ?s2 - step) ; successor relation between step tokens
    (smaller ?d - disk ?p - place)       ; disk ?d is smaller than place ?p (disk or peg)
  )

  (:action move
    :parameters (?a - agent
                 ?d - disk
                 ?from - place
                 ?to - place
                 ?s - step
                 ?s2 - step)
    :precondition (and
      (hanoi_player_agent ?a)   ; only designated player may perform moves
      (on ?d ?from)             ; disk is directly on its supporting place
      (clear ?d)                ; disk has no disk on top (is top-most)
      (clear ?to)               ; target support has no disk on top (can accept this disk)
      (smaller ?d ?to)          ; size constraint: cannot place larger on smaller
      (current-step ?s)         ; enforce ordered step execution
      (step-successor ?s ?s2)   ; require provided successor step
      (not (on ?d ?to))         ; enforce that the move changes the disk's support (no no-op move)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)             ; after removing top disk, its former support has no disk directly on it
      (not (clear ?to))         ; target support now has a disk on top
      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)