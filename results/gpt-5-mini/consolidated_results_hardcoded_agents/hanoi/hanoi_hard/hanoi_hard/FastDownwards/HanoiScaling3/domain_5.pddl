(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent step)

  (:predicates
    (on ?d - disk ?p - place)               ; disk directly on a supporting place (peg or disk)
    (clear ?p - place)                      ; nothing directly on this place (peg or disk)
    (hanoi_player_agent ?a - agent)         ; identifies the moving agent allowed to perform moves
    (current-step ?s - step)                ; current discrete step token
    (step-successor ?s1 - step ?s2 - step)  ; successor relation between step tokens
    (smaller ?d - disk ?p - place)          ; disk ?d is smaller than place ?p (disk or peg)
  )

  (:action move
    :parameters (?a - agent
                 ?d - disk
                 ?from - place
                 ?to - place
                 ?s - step
                 ?s2 - step)
    :precondition (and
      (hanoi_player_agent ?a)        ; only designated player may perform moves
      (on ?d ?from)                  ; disk is directly on its supporting place
      (clear ?d)                     ; disk is top-most (nothing on it)
      (clear ?to)                    ; target support is top-most (empty place or top disk)
      (smaller ?d ?to)               ; size constraint: moving disk is smaller than target support
      (current-step ?s)              ; enforce ordered step execution
      (step-successor ?s ?s2)        ; require provided successor step
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)                  ; former support becomes top-most after removal
      (not (clear ?to))              ; target support now has something on top
      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)