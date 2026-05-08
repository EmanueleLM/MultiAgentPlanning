(define (domain hanoi-five)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (on ?d - object ?p - object ?s - step)    ;; disk ?d is directly on placeable ?p at step ?s (p may be a peg or a disk)
    (next ?s - step ?s2 - step)              ;; successor relation between steps
    (smaller ?d1 - object ?d2 - object)      ;; d1 is smaller than d2 (only holds for disk pairs)
    (peg ?o - object)                        ;; static: object is a peg
    (disk ?o - object)                       ;; static: object is a disk
  )

  ;; Move disk A onto an empty peg (peg must be empty at step ?s)
  (:action move-A-to-peg
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      ;; snapshot of where each disk is at step ?s
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; A must be top (no disk on A at step ?s)
      (not (on B A ?s)) (not (on C A ?s)) (not (on D A ?s)) (not (on E A ?s))
      ;; destination must be a peg and must be empty (no disk directly on ?to at step ?s)
      (peg ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
    )
    :effect (and
      ;; remove the "on ... at ?s" facts for all disks (frame to next step)
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      ;; add the "on ... at ?s2" facts: A moved to ?to, others retain their places
      (on A ?to ?s2) (on B ?pB ?s2) (on C ?pC ?s2) (on D ?pD ?s2) (on E ?pE ?s2)
    )
  )

  ;; Move disk A onto top of another disk ?to (must be disk and top, and larger than A)
  (:action move-A-to-disk
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; A must be top
      (not (on B A ?s)) (not (on C A ?s)) (not (on D A ?s)) (not (on E A ?s))
      ;; target must be a disk and must be top (no disk on ?to)
      (disk ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
      ;; size ordering: A smaller than destination disk
      (smaller A ?to)
    )
    :effect (and
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      (on A ?to ?s2) (on B ?pB ?s2) (on C ?pC ?s2) (on D ?pD ?s2) (on E ?pE ?s2)
    )
  )

  ;; Move disk B onto an empty peg
  (:action move-B-to-peg
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; B must be top
      (not (on A B ?s)) (not (on C B ?s)) (not (on D B ?s)) (not (on E B ?s))
      ;; destination peg must be empty
      (peg ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
    )
    :effect (and
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      (on A ?pA ?s2) (on B ?to ?s2) (on C ?pC ?s2) (on D ?pD ?s2) (on E ?pE ?s2)
    )
  )

  ;; Move disk B onto another disk
  (:action move-B-to-disk
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; B must be top
      (not (on A B ?s)) (not (on C B ?s)) (not (on D B ?s)) (not (on E B ?s))
      ;; destination disk must be top
      (disk ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
      ;; size ordering
      (smaller B ?to)
    )
    :effect (and
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      (on A ?pA ?s2) (on B ?to ?s2) (on C ?pC ?s2) (on D ?pD ?s2) (on E ?pE ?s2)
    )
  )

  ;; Move disk C onto an empty peg
  (:action move-C-to-peg
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; C must be top
      (not (on A C ?s)) (not (on B C ?s)) (not (on D C ?s)) (not (on E C ?s))
      ;; destination peg must be empty
      (peg ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
    )
    :effect (and
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      (on A ?pA ?s2) (on B ?pB ?s2) (on C ?to ?s2) (on D ?pD ?s2) (on E ?pE ?s2)
    )
  )

  ;; Move disk C onto another disk
  (:action move-C-to-disk
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; C must be top
      (not (on A C ?s)) (not (on B C ?s)) (not (on D C ?s)) (not (on E C ?s))
      ;; destination disk must be top
      (disk ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
      ;; size ordering
      (smaller C ?to)
    )
    :effect (and
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      (on A ?pA ?s2) (on B ?pB ?s2) (on C ?to ?s2) (on D ?pD ?s2) (on E ?pE ?s2)
    )
  )

  ;; Move disk D onto an empty peg
  (:action move-D-to-peg
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; D must be top
      (not (on A D ?s)) (not (on B D ?s)) (not (on C D ?s)) (not (on E D ?s))
      ;; destination peg must be empty
      (peg ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
    )
    :effect (and
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      (on A ?pA ?s2) (on B ?pB ?s2) (on C ?pC ?s2) (on D ?to ?s2) (on E ?pE ?s2)
    )
  )

  ;; Move disk D onto another disk
  (:action move-D-to-disk
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; D must be top
      (not (on A D ?s)) (not (on B D ?s)) (not (on C D ?s)) (not (on E D ?s))
      ;; destination disk must be top
      (disk ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
      ;; size ordering
      (smaller D ?to)
    )
    :effect (and
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      (on A ?pA ?s2) (on B ?pB ?s2) (on C ?pC ?s2) (on D ?to ?s2) (on E ?pE ?s2)
    )
  )

  ;; Move disk E onto an empty peg
  (:action move-E-to-peg
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; E must be top
      (not (on A E ?s)) (not (on B E ?s)) (not (on C E ?s)) (not (on D E ?s))
      ;; destination peg must be empty
      (peg ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
    )
    :effect (and
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      (on A ?pA ?s2) (on B ?pB ?s2) (on C ?pC ?s2) (on D ?pD ?s2) (on E ?to ?s2)
    )
  )

  ;; Move disk E onto another disk
  (:action move-E-to-disk
    :parameters (?s - step ?s2 - step
                 ?pA ?pB ?pC ?pD ?pE - object
                 ?to - object)
    :precondition (and
      (next ?s ?s2)
      (on A ?pA ?s) (on B ?pB ?s) (on C ?pC ?s) (on D ?pD ?s) (on E ?pE ?s)
      ;; E must be top
      (not (on A E ?s)) (not (on B E ?s)) (not (on C E ?s)) (not (on D E ?s))
      ;; destination disk must be top
      (disk ?to)
      (not (on A ?to ?s)) (not (on B ?to ?s)) (not (on C ?to ?s)) (not (on D ?to ?s)) (not (on E ?to ?s))
      ;; size ordering
      (smaller E ?to)
    )
    :effect (and
      (not (on A ?pA ?s)) (not (on B ?pB ?s)) (not (on C ?pC ?s)) (not (on D ?pD ?s)) (not (on E ?pE ?s))
      (on A ?pA ?s2) (on B ?pB ?s2) (on C ?pC ?s2) (on D ?pD ?s2) (on E ?to ?s2)
    )
  )

)