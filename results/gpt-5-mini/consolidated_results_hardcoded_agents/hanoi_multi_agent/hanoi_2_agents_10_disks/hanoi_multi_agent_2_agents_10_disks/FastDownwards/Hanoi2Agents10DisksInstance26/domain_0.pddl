(define (domain hanoi-two-agent)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (at ?d ?peg)                ; disk ?d is located at peg ?peg (peg id)
    (above ?upper ?lower)       ; ?upper is immediately above ?lower (immediate support)
    (top ?peg ?disk)            ; ?disk is the current top item on ?peg (could be a base token)
    (clear ?disk)               ; no disk directly above ?disk (i.e. it is clear on top)
    (smaller ?d1 ?d2)           ; static relation: d1 is strictly smaller than d2 (or peg base)
  )

  ;; Agent 1 move action (encoded with agent id in the name)
  ;; Parameters:
  ;;  ?d        - disk being moved
  ;;  ?from     - peg id where ?d currently is
  ;;  ?to       - peg id to move ?d to
  ;;  ?below    - the immediate support that was directly below ?d on the source peg
  ;;  ?topdest  - the disk/token that was previously top on the destination peg
  (:action move-agent1
    :parameters (?d ?from ?to ?below ?topdest)
    :precondition (and
      (at ?d ?from)
      (top ?from ?d)           ; ?d must be the top item on source peg
      (top ?to ?topdest)       ; ?topdest is the top item on destination peg (may be a base token)
      (above ?d ?below)        ; ?below is the immediate support under ?d (immediate lower item)
      (smaller ?d ?topdest)    ; disk-size constraint: moving disk must be smaller than destination top
    )
    :effect (and
      ;; update source peg top: remove old top, set new top to the item that was below the moved disk
      (not (top ?from ?d))
      (top ?from ?below)

      ;; remove the old immediate-support link at source, set new support relation at destination
      (not (above ?d ?below))
      (above ?d ?topdest)

      ;; move the disk's peg location
      (not (at ?d ?from))
      (at ?d ?to)

      ;; update destination peg top: previous top is no longer top, moved disk becomes new top
      (not (top ?to ?topdest))
      (top ?to ?d)

      ;; update clear flags: the disk moved becomes clear (no disk on top),
      ;; the disk that was previously top on destination is no longer clear,
      ;; the item that is now top on source (?below) becomes clear
      (clear ?d)
      (not (clear ?topdest))
      (clear ?below)
    )
  )

  ;; Agent 2 move action (agent_2 is modeled but will perform no moves in this problem)
  (:action move-agent2
    :parameters (?d ?from ?to ?below ?topdest)
    :precondition (and
      (at ?d ?from)
      (top ?from ?d)
      (top ?to ?topdest)
      (above ?d ?below)
      (smaller ?d ?topdest)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?below)
      (not (above ?d ?below))
      (above ?d ?topdest)
      (not (at ?d ?from))
      (at ?d ?to)
      (not (top ?to ?topdest))
      (top ?to ?d)
      (clear ?d)
      (not (clear ?topdest))
      (clear ?below)
    )
  )
)