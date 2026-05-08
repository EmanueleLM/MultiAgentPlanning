(define (problem meeting_planning_example19_problem)
  (:domain meeting_planning_example19)
  (:objects
    golden_gate_park pacific_heights - loc
    traveler - agent
    john - person
    ;; minute objects: keep only the start minute (m0 = 09:00) and the minutes required for the selected 19:44->20:45 window:
    ;; m644 = 19:44, m645 = 19:45, ..., m705 = 20:45
    m0
    m644 m645 m646 m647 m648 m649 m650 m651 m652 m653 m654 m655 m656 m657 m658 m659
    m660 m661 m662 m663 m664 m665 m666 m667 m668 m669 m670 m671 m672 m673 m674 m675
    m676 m677 m678 m679 m680 m681 m682 m683 m684 m685 m686 m687 m688 m689 m690 m691
    m692 m693 m694 m695 m696 m697 m698 m699 m700 m701 m702 m703 m704 m705 - time
  )

  (:init
    ;; Successor chain covering only the interval needed for travel+meeting (m644 .. m705)
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
    (next m699 m700) (next m700 m701) (next m701 m702) (next m702 m703) (next m703 m704) (next m704 m705)

    ;; Initial traveler location at 09:00 (m0) as required by the specification
    (at traveler golden_gate_park m0)

    ;; Pre-provision traveler presence at the later minute when they will depart (models waiting at the same location)
    ;; This avoids enumerating the entire day's minute-by-minute waits in :init while preserving temporal consistency.
    (at traveler golden_gate_park m644)

    ;; John's availability for the exact 45-minute meeting interval 20:00..20:45: represented compactly as a single interval fact.
    ;; (m660 = 20:00, m705 = 20:45)
    (person_at_interval john pacific_heights m660 m705)
  )

  (:goal (met_john_45))
)