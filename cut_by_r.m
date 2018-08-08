function [node] = cut_by_r(X,r,currentNode)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ���ݵ�rά��X�����зֻ�ýڵ�
% X�����ݵ㼯
% r���з�ά��
% node���ṹ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Node_template = struct(...
    'isRoot',0,...      �Ƿ��Ǹ��ڵ㣬0���ǣ�1��
    'isLeaf',0,...      �Ƿ���Ҷ�ӽڵ�
    'isLeft',0,...      �Ƿ�������
    'isRight',0,...     �Ƿ����Һ��� ��������ʱ���ֵܽ��
    'hasLeft',0,...     �Ƿ�������
    'hasRight',0,...    �Ƿ����Һ���
    'parent',-1,...     ���׽�㣬��������ʱ����
    'val',-1,...        �зֵ�����
    'left',-1,...       ��ڵ�(��Ȼ�ǽṹ�壩
    'right',-1,...      �ҽڵ�
    'leftSet',-1,...    �ֵ��ұߵĵ㼯(����),-1��ʾ�ռ�
    'rightSet',-1,...   �ֵ���ߵĵ㼯(����)��-1��ʾ�ռ� 
    'r',-1,...          �з�ά��);
    'visited',0,....     ����ʱ�Ƿ���ʱ�־)��0Ϊδ���ʣ�1Ϊ���ʹ�
    'index',-1 ...      �±�
    );                  %�ڵ�ṹ��ģ��

dim = size(X,1)-1;    %���ݵ��ά��
num = size(X,2);    %���ݼ�����
node = currentNode;
node.r = r;
if num == 1
    %���ݼ���ֻ��һ����
    node.val = X(1:dim,1);
    node.isLeaf = 1;
    node.index = X(dim+1,:);
else
    X_sorted = sort_by_r(X,r);
    mid = ceil(num/2);
    node.val = X_sorted(1:dim,mid);
    node.index = X_sorted(dim+1,mid);
    if mid>1
        node.leftSet = X_sorted(:,1:ceil(num/2)-1);
    end
    if mid<num
        node.rightSet = X_sorted(:,ceil(num/2)+1:end);
    end
end
r = mod(r,dim)+1;
if node.leftSet ~= -1
    node.hasLeft = 1;
    node.left = Node_template;
    node.left.parent = node;
    node.left.isLeft = 1;
    node.left = cut_by_r(node.leftSet,r,node.left);
end
if node.rightSet ~= -1
    node.hasRight = 1;
    node.right = Node_template;
    node.right.parent = node;
    node.right.isRight = 1;
    node.right = cut_by_r(node.rightSet,r,node.right);
end


