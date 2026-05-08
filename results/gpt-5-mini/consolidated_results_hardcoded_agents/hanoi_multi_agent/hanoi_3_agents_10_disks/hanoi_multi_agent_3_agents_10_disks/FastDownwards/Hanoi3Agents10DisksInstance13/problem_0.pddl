(define (problem hanoi-multi-agent-instance)
  (:domain multi-agent-hanoi)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ;; Initial stack: A on B, B on C, C on D, D on E, E on F, F on G, G on H, H on I, I on J, J on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; clear/top facts: top disk A is clear; pegs middle and right are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering: every smaller disk is smaller than every larger disk (explicitly enumerated)
    ;; A is smaller than B..J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    ;; B is smaller than C..J
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    ;; C is smaller than D..J
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    ;; D is smaller than E..J
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    ;; E is smaller than F..J
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    ;; F is smaller than G..J
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    ;; G is smaller than H..J
    (smaller G H) (smaller G I) (smaller G J)
    ;; H is smaller than I,J
    (smaller H I) (smaller H J)
    ;; I is smaller than J
    (smaller I J)

    ;; Also treat pegs as supports larger than every disk to allow moving onto pegs
    ;; (makes the single precondition smaller ?d ?to sufficient for both disk->disk and disk->peg moves)
    (smaller A left) (smaller A middle) (smaller A right)
    (smaller B left) (smaller B middle) (smaller B right)
    (smaller C left) (smaller C middle) (smaller C right)
    (smaller D left) (smaller D middle) (smaller D right)
    (smaller E left) (smaller E middle) (smaller E right)
    (smaller F left) (smaller F middle) (smaller F right)
    (smaller G left) (smaller G middle) (smaller G right)
    (smaller H left) (smaller H middle) (smaller H right)
    (smaller I left) (smaller I middle) (smaller I right)
    (smaller J left) (smaller J middle) (smaller J right)

    ;; Agent permissions: only agent_1 may move disks A,B,C,D (as provided). Agents 2 and 3 have no can-move facts.
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)

    ;; Note: E,F,G,H,I,J are intentionally not given any can-move facts for any agent (they will not be moved)
  )

  ;; Goal: required rearrangement per problem statement:
  ;; - Disk A must be on right peg
  ;; - Disks C and D must be on the middle peg with C immediately on D (i.e., C on D and D on middle)
  ;; - Disk B must be directly on disk E (B on top of E)
  (:goal (and
    (on A right)
    (on C D)
    (on D middle)
    (on B E)
  ))
)