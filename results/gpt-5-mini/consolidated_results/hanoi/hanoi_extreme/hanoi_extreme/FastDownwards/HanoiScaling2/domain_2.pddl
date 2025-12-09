(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ; on ?d ?p : disk ?d is directly on place ?p (peg or disk)
    (on ?d - disk ?p - place)
    ; clear ?p : place ?p has no disk on top (applies to pegs and disks)
    (clear ?p - place)
    ; smaller relation is static: disk ?d1 is strictly smaller than disk ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ; at-step marks the current discrete stage
    (at-step ?s - step)
    ; next defines the strict successor relation between stages
    (next ?s1 - step ?s2 - step)
  )

  ; Move a top disk from any place onto an empty peg, advancing from one stage to its successor.
  ; Preconditions ensure:
  ;  - the moved disk is on the specified support (?from),
  ;  - the moved disk has no disk on top (is the top disk),
  ;  - the destination peg has no disk on top (move is onto an empty peg),
  ;  - the action occurs at the current stage and advances to the successor stage.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - step ?s2 - step)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (at-step ?s)
                    (next ?s ?s2)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              ; after removing ?d from ?from, ?from becomes clear (no disk on top)
              (clear ?from)
              ; destination peg now has a disk on top
              (not (clear ?to))
              ; advance the stage marker
              (not (at-step ?s))
              (at-step ?s2)
             )
  )

  ; Move a top disk from any place onto an empty disk that is larger than the moving disk,
  ; advancing from one stage to its successor.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - step ?s2 - step)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (at-step ?s)
                    (next ?s ?s2)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              ; after removing ?d from ?from, ?from becomes clear
              (clear ?from)
              ; the disk ?to now has a disk on top
              (not (clear ?to))
              ; advance the stage marker
              (not (at-step ?s))
              (at-step ?s2)
             )
  )
)