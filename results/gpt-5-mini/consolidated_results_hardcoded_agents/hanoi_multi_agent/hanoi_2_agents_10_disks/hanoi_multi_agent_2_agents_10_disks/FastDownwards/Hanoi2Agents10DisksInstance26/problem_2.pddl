(define (problem hanoi-2agent-10-instance26)
  (:domain hanoi-two-agent-10)

  (:objects
    ; disks
    A B C D E F G H I J
    ; base tokens (one per peg)
    base-left base-middle base-right
    ; pegs (used as constants in predicates)
    left middle right
    ; agents (not used as parameters but kept for completeness)
    agent_1 agent_2 orchestrator
  )

  (:init
    ; disk locations: all disks start on the left peg
    (at A left) (at B left) (at C left) (at D left) (at E left)
    (at F left) (at G left) (at H left) (at I left) (at J left)

    ; base tokens are at their pegs
    (at base-left left) (at base-middle middle) (at base-right right)

    ; initial immediate-support chain on left (top -> bottom):
    ; A above B, B above C, C above D, D above E, E above F, F above G, G above H, H above I, I above J, J above base-left
    (above A B) (above B C) (above C D) (above D E) (above E F)
    (above F G) (above G H) (above H I) (above I J) (above J base-left)

    ; initial tops on pegs
    (top left A)
    (top middle base-middle)
    (top right base-right)

    ; initial clear items (nothing above them)
    (clear A) (clear base-middle) (clear base-right)

    ; static size ordering (smaller relations)
    ; A < B < C < D < E < F < G < H < I < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; disks are smaller than base tokens
    (smaller A base-left) (smaller A base-middle) (smaller A base-right)
    (smaller B base-left) (smaller B base-middle) (smaller B base-right)
    (smaller C base-left) (smaller C base-middle) (smaller C base-right)
    (smaller D base-left) (smaller D base-middle) (smaller D base-right)
    (smaller E base-left) (smaller E base-middle) (smaller E base-right)
    (smaller F base-left) (smaller F base-middle) (smaller F base-right)
    (smaller G base-left) (smaller G base-middle) (smaller G base-right)
    (smaller H base-left) (smaller H base-middle) (smaller H base-right)
    (smaller I base-left) (smaller I base-middle) (smaller I base-right)
    (smaller J base-left) (smaller J base-middle) (smaller J base-right)
  )

  ;; Goal: the human-specified final configuration (left top-to-bottom B E F G H I J; middle C; right A D).
  (:goal (and
    ; locations
    (at B left) (at E left) (at F left) (at G left) (at H left) (at I left) (at J left)
    (at C middle)
    (at A right) (at D right)

    ; left stack immediate supports: B above E, E above F, F above G, G above H, H above I, I above J, J above base-left
    (above B E) (above E F) (above F G) (above G H) (above H I) (above I J) (above J base-left)

    ; middle: C above base-middle
    (above C base-middle)

    ; right: A above D, D above base-right
    (above A D) (above D base-right)

    ; top tokens
    (top left B)
    (top middle C)
    (top right A)
  ))
)