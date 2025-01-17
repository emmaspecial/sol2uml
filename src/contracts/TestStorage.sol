
struct SubOneSlot {
    address account;    // 20 bytes
    bool flag;          // 1 byte
    int8 count;         // 1 byte
}

struct OneSlot {
    address account;// 20 bytes
    uint88 sum;     // 11 bytes
    int8 count;     // 1 bytes
}

struct SubTwoSlots {
    address account1;
    address account2;
    bool flag1;
    bool flag2;
}

enum Severity {
    Low,
    Medium,
    High
}

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);
}

contract GrandParent {
    bool initGP;
    address grandParent;

    struct FlagsStruct {
        bool flag1;
        bool[2] flags;
        bool flag2;
    }
}

contract Parent is GrandParent {
    bool initP;
    bool initialized;
    address parent;
}

contract Parent2 is GrandParent {
    bool initP2;
    address parent2;
}

contract TestStorage is Parent, Parent2 {

    struct TwoSlots {
        bytes32 hash1;
        bytes32 hash2;
    }

    struct FixedArray {
        uint16 num1;
        bytes30[2] data;
        uint16 num2;
    }

    enum Status {
        Open,
        Resolved
    }

    uint256 public constant SCALE = 1e18;
    uint256 internal constant DIVISOR = 1e18;
    address public immutable SuperUser;

    address owner;
    IERC20 token;
    IERC20[] tokens;
    IERC20[2] tokenPair;
    uint256 totalSupply = 123123123123456789012345678;
    uint128 rate1 = 123 * 1e18;
    uint128 rate2 = 456 * 1e18;
    // fixed float1 = 1.0234;
    // ufixed float2 = 99.9999;
    // ufixed128x18 float3 = 0.001;
    // fixed128x18 float4 = 12345.0123;
    bytes32 hash;
    bool public flag1 = true;
    bool private flag2 = false;
    bool internal flag3 = true;
    bool flag4 = false;
    bool[2] flags = [true, false];
    bool flag5;
    bool[2][2] flags2x2 = [[true, false], [true, true]];
    bool flag6;
    bool[2][3] flags2x3;
    bool flag7;
    bool[3][2] flags3x2;
    bool[33][2] flags33x2;
    bool flag8;
    bool[2][] flags2xdyn;
    bool flag9;
    bool[][2] flagsDynx2;
    bool[33][2][2] bool_33x2x2;
    bool flag10;
    bytes30[2][6] bytes30_2x6;
    bytes30[6][2] bytes30_6x2;
    bool flag11;
    Status status;
    Severity severity;
    SubOneSlot subSlot;
    uint8 oneByteNumber;
    OneSlot oneSlot;
    SubTwoSlots subTwoSlot;
    TwoSlots twoSlots;
    FixedArray fixedArray;
    FlagsStruct flagStruct;
    int16 arrayCount;
    uint64[] dynamicIntArray;
    uint256[3] fixedIntArray = [1000,2000,3000];
    string nameSlot;
    mapping (address => bool) blacklist;
    mapping (address => uint256) balance;

    constructor(address _superUser) {
        superUser = _superUser;
    }
}
