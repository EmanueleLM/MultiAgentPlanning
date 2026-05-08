(define (problem meeting_planning_example19_problem)
  (:domain meeting_planning_example19)
  (:objects
    golden_gate_park pacific_heights - loc
    ;; Minimal set of minute objects needed for the chosen feasible schedule:
    ;; m0 = 09:00 (initial), m644 = 19:44 (departure), m645..m705 cover travel + 45-minute meeting through 20:45.
    m0 m644 m645 m646 m647 m648 m649 m650 m651 m652 m653 m654 m655 m656 m657 m658 m659 m660
    m661 m662 m663 m664 m665 m666 m667 m668 m669 m670 m671 m672 m673 m674 m675 m676 m677 m678
    m679 m680 m681 m682 m683 m684 m685 m686 m687 m688 m689 m690 m691 m692 m693 m694 m695 m696
    m697 m698 m699 m700 m701 m702 m703 m704 m705 - time
  )

  (:init
    ;; Successor chain for the contiguous interval used for travel + meeting: m644 .. m705
    (next m644 m645) (next m645 m646) (next m646 m647) (next m647 m648) (next m648 m649)
    (next m649 m650) (next m650 m651) (next m651 m652) (next m652 m653) (next m653 m654)
    (next m654 m655) (next m655 m656) (next m656 m657) (next m657 m658) (next m658 m659)
    (next m659 m660) (next m660 m661) (next m661 m662) (next m662 m663) (next m663 m664)
    (next m664 m665) (next m665 m666) (next m666 m667) (next m667 m668) (next m668 m669)
    (next m669 m670) (next m670 m671) (next m671 m672) (next m672 m673) (next m673 m674)
    (next m674 m675) (next m675 m676) (next m676 m677) (next m677 m678) (next m678 m679)
    (next m679 m680) (next m680 m681) (next m681 m682) (next m682 m683) (next m683 m684)
    (next m684 m685) (next m685 m686) (next m686 m687) (next m687 m688) (next m688 m689)
    (next m689 m690) (next m690 m691) (next m691 m692) (next m692 m693) (next m693 m694)
    (next m694 m695) (next m695 m696) (next m696 m697) (next m697 m698) (next m698 m699)
    (next m699 m700) (next m700 m701) (next m701 m702) (next m702 m703) (next m703 m704)
    (next m704 m705)

    ;; Coarse "later" fact allowing explicit idle jump from the start of the day to the meeting-preparation minute.
    ;; This encodes the long idle interval 09:00 -> 19:44 without enumerating every intermediate minute in :init.
    (later m0 m644)

    ;; Initial traveler location at 09:00 (m0)
    (at_traveler golden_gate_park m0)

    ;; John's presence only for the exact 45 minute window needed by the chosen schedule:
    ;; meeting starts at m660 = 20:00 and occupies m660..m704 inclusive (45 minutes).
    (john_at pacific_heights m660) (john_at pacific_heights m661) (john_at pacific_heights m662)
    (john_at pacific_heights m663) (john_at pacific_heights m664) (john_at pacific_heights m665)
    (john_at pacific_heights m666) (john_at pacific_heights m667) (john_at pacific_heights m668)
    (john_at pacific_heights m669) (john_at pacific_heights m670) (john_at pacific_heights m671)
    (john_at pacific_heights m672) (john_at pacific_heights m673) (john_at pacific_heights m674)
    (john_at pacific_heights m675) (john_at pacific_heights m676) (john_at pacific_heights m677)
    (john_at pacific_heights m678) (john_at pacific_heights m679) (john_at pacific_heights m680)
    (john_at pacific_heights m681) (john_at pacific_heights m682) (john_at pacific_heights m683)
    (john_at pacific_heights m684) (john_at pacific_heights m685) (john_at pacific_heights m686)
    (john_at pacific_heights m687) (john_at pacific_heights m688) (john_at pacific_heights m689)
    (john_at pacific_heights m690) (john_at pacific_heights m691) (john_at pacific_heights m692)
    (john_at pacific_heights m693) (john_at pacific_heights m694) (john_at pacific_heights m695)
    (john_at pacific_heights m696) (john_at pacific_heights m697) (john_at pacific_heights m698)
    (john_at pacific_heights m699) (john_at pacific_heights m700) (john_at pacific_heights m701)
    (john_at pacific_heights m702) (john_at pacific_heights m703) (john_at pacific_heights m704)
  )

  (:goal (met_john_45))
)